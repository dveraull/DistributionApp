//
//  RestApi.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//


import Foundation


protocol ResApi{
    
    func login(username:String, password:String, completion:@escaping (_ user:UserEntity?, _ error:ErrorEntity?) -> Void)
}
