//
//  Custommer.swift
//  DistributionApp
//
//  Created by Jordan Capa on 1/02/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import ObjectMapper
import GoogleMaps



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

public class CustommerEntityResponse: Mappable  {
    
    var custom: Custommer?
    var error: ErrorEntity?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.custom <- map["custom"]
        self.error      <- map["error"]
        
    }
}

public class Custommer: NSObject,Mappable  {
    
    var id:Int?
    var name:String?
    var address:String?
    var phone:Int?
    var email:String?
    var location:Location?
    var dni:Int?
    
    required public init?(map: Map) {
    }
    
    
    override init() {
        super.init()
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
    
    func markerCustomer() -> GMSMarker{
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: Double(self.location!.latitude!), longitude: Double(self.location!.longitude!))
        marker2.title = self.name
        marker2.snippet = self.address
        return marker2
    }
}

public class Location: NSObject,Mappable{
    
    var latitude:Double?
    var longitude:Double?
    
    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.latitude   <- map["latitude"]
        self.longitude  <- map["longitude"]
    }
    
    
    
}
