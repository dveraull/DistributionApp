//
//  ErrorEntity.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import ObjectMapper


public class ErrorResponse: Mappable  {
    
    var error:ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.error <- map["error"]
    }
}

public class ErrorEntity: Mappable  {
    
    var status:Int?
    var title:String?
    var detail:String?
    
    init(status:Int?, title:String?, detail:String?) {
        self.status = status
        self.title = title
        self.detail = detail
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.status <- map["status"]
        self.title  <- map["title"]
        self.detail <- map["detail"]
        self.detail <- map["type"]
    }
}
