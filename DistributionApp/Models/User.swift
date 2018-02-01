//
//  User.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserEntityResponse: Mappable  {
    
    var user:User?
    var error: ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.user <- map["user"]
        self.error <- map["error"]
    }
}


class User: NSObject, Mappable {
    
    var usuario: String?
    var correo: String?
    var nombres: String?
    var apellidos: String?
    var token: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        usuario <- map["username"]
        correo <- map["email"]
        nombres <- map["first_name"]
        apellidos <- map["last_name"]
        token <- map["token"]
    }
    
}
