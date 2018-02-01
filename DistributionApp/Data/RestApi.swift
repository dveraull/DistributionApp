//
//  RestApi.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//


import Foundation


protocol RestApi{
 
    func login(username:String, password:String, completion:@escaping (_ user:User?, _ error:ErrorEntity?) -> Void)
    func getCustommers(completion:@escaping (_ custommers:[Custommer]?, _ error:ErrorEntity?) -> Void)
}

