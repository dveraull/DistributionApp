//
//  LoginViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SVProgressHUD

class LoginViewController: UIViewController {
   
    public static let sharedInstance = LoginViewController()
  
    @IBOutlet weak var usuarioTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var alamofireManager : Alamofire.SessionManager?
    var jsonArray: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        
        usuarioTextfield.attributedPlaceholder = NSAttributedString(string:"Username", attributes:[NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordTextfield.attributedPlaceholder = NSAttributedString(string:"Password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.white])
        
      // Metodo para navegar hacia la siguiente ventana
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Actions
    
   @IBAction func loginButtonPressed(_ sender: Any) {
       // downloadDataFromAPI()
    
    SVProgressHUD.show()
    RestApiData.sharedInstance.login(username: self.usuarioTextfield.text!, password: self.passwordTextfield.text!) { (user, error) in
        SVProgressHUD.dismiss()
        if(error == nil){
            if(user != nil){
                self.performSegue(withIdentifier: "showHome", sender: nil)
            }
            else{
                print("Error")
            }
        }
    }
    
    }
    
    
    // MARK: - Own Methods
    
    func initView(){
        self.navigationController?.navigationBar.isHidden = true
        self.loginButton.layer.cornerRadius = 5.0
    }
    
    func downloadDataFromAPI(){
        let  usuario = self.usuarioTextfield.text
        let contrasenia = self.passwordTextfield.text
        let headers = ["Content-Type": "application/json"]

        //1.
        Alamofire.request("http://192.168.1.79:8000/api/login/", method: .post, parameters: [ "username" : usuario!,"password": contrasenia!],encoding: JSONEncoding.default, headers: headers ).responseObject { (response: DataResponse<User>) in
            
            print(response)
            //2.
         //   if let JSON = response.result.value{
                if response.result.isFailure
                {
                    print("ERROR! Reverse geocoding failed!")
                    
                }
                else if let value = response.result.value
                {
                    /*var country: String? = nil
                    var county: String? = nil
                    var city: String? = nil
                    var town: String? = nil
                    var village: String? = nil*/
                    print("data: \(value)")
                   // let self.json = JSON (value)
                }
                else
                {
                    print("Cannot get response result value!")
                }
    
                }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
