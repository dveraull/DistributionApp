//
//  Custommer.swift
//  DistributionApp
//
//  Created by Jordan Capa on 1/02/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import ObjectMapper


public class CustommerResponse: Mappable  {
    
    var customers:[Custommer]?
    var error: ErrorEntity?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.customers <- map["custommers"]
        self.error      <- map["error"]
        
    }
}

public class Custommer: Mappable  {
    
    var id:Int?
    var name:String?
    var address:String?
    var phone:Int?
    var email:String?
    var location:Location?
    var dni:Int?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id             <- map["id"]
        self.name           <- map["name"]
        self.address        <- map["address"]
        self.phone          <- map["phone"]
        self.email          <- map["email"]
        self.location       <- map["location"]
        self.dni            <- map["dni"]
    }
}

public class Location: Mappable{
    
    var latitude:Int?
    var longitude:Int?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.latitude   <- map["latitude"]
        self.longitude  <- map["longitude"]
    }
}
