//
//  RestApiData.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ReachabilitySwift

public class RestApiData: RestApi{
    
    public static let sharedInstance = RestApiData()
    
    var alamofireManager : Alamofire.SessionManager?
    //var alamofireManagerAuth : Alamofire.SessionManager?
    
    let reachability = Reachability()
    //var requestAlamo:Alamofire.DataRequest?
    
    let upsError:ErrorEntity = ErrorEntity(status: 999, title: "¡Ups!", detail: "Ocurrió un problema al conectarse con Puntos, por favor intenta nuevamente.")
    
    let redError:ErrorEntity = ErrorEntity(status: 999, title: "", detail: "Tu conecxión a internet esta fallando, por favor intenta de nuevo.")
    
    
    typealias VerifyResponse = (_ succeeded: Bool)->Void
    
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 4
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
        //self.alamofireManagerAuth = Alamofire.SessionManager(configuration: configuration)
        //self.managmentAuth()
    }
    
    func login(username:String, password:String, completion:@escaping (_ user:User?, _ error:ErrorEntity?) -> Void){
        
        var user:User?
        var error:ErrorEntity?
        
        if(self.isThereNetworkConnection()){
            
            let parameters : [ String : Any] = [
                "username" : username,
                "password" : password
            ]
            
            let url = "http://192.168.8.101:8000/api/login/"
            
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<UserEntityResponse>) in
                
                switch response.result {
                case .success:
                    let data = response.result.value
                    if(response.response?.statusCode == 200){
                        user = data?.user
                        error = data?.error
                        
//                        User.sharedInstance.saveUser(username: (user?.username)!,
//                                                     email: (user?.email)!,
//                                                     first_name: (user?.first_name)!,
//                                                     last_name: (user?.last_name)!,
//                                                     token: (user?.token)!)
                        
                        UniversalUser.sharedInstance.usuario = user?.usuario
                        UniversalUser.sharedInstance.nombres = user?.nombres
                        UniversalUser.sharedInstance.correo = user?.correo
                        UniversalUser.sharedInstance.apellidos = user?.apellidos
                        UniversalUser.sharedInstance.token = user?.token
                        
                        completion(user, error)
                    }
                    if(response.response?.statusCode == 400){
                        error = data?.error
                        completion(user, error)
                    }
                case .failure(let err):
                    completion(user, self.upsError)
                }
            }
            
        }else{
            completion(user, self.redError)
        }
    }
    
    func getCustommers(completion:@escaping (_ custommers:[Custommer]?, _ error:ErrorEntity?) -> Void){
        var custommers:[Custommer]?
        var error:ErrorEntity?
        
        if(self.isThereNetworkConnection()){
        
            
            let url = "http://192.168.8.101:8000/api/custommer/"
            
            print(url)
            
            self.alamofireManager?.request(url, method: .get, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<CustommerResponse>) in
                
                switch response.result {
                case .success:
                    let data = response.result.value
                    if(response.response?.statusCode == 200){
                        custommers = data?.customers
                        error = data?.error
                        
                        //                        User.sharedInstance.saveUser(username: (user?.username)!,
                        //                                                     email: (user?.email)!,
                        //                                                     first_name: (user?.first_name)!,
                        //                                                     last_name: (user?.last_name)!,
                        //                                                     token: (user?.token)!)
                        
                        UniversalUser.sharedInstance.clientes = data?.customers
                        completion(custommers, error)
                    }
                    if(response.response?.statusCode == 400){
                        error = data?.error
                        completion(custommers, error)
                    }
                case .failure(let err):
                    completion(custommers, self.upsError)
                }
            }
            
        }else{
            completion(custommers, self.redError)
        }
    }
    
    public func isThereNetworkConnection()->Bool{
        var isConnected:Bool
        isConnected = (self.reachability?.isReachable)!
        return isConnected
    }
    
}
