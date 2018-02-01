//
//  Cliente.swift
//  DistributionApp
//
//  Created by MacAMP on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation
import GoogleMaps

class Cliente{
    
    var idcliente: Int
    var nombres: String
    var dni: String
    var telefono: String
    var x: String
    var y: String
    var direccion: String
    //var marker = GMSMarker()
    
    
    
    init(_ idcliente: Int, _ nombres: String, _ x: String, _ y: String, _ direccion: String, _ dni : String, _ telefono : String) {
        self.idcliente=idcliente
        self.nombres=nombres
        self.x=x
        self.y=y
        //self.marker=marcadorCliente(x,y, cliente, direccion)
        //self.marcadorCliente(x,y, cliente, direccion)
        self.direccion=direccion
        self.dni=dni
        self.telefono=telefono
        // super.init()
        
    }
    
    func marcadorCliente() -> GMSMarker{
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: Double(self.x)!, longitude: Double(self.y)!)
        marker2.title = self.nombres
        marker2.snippet = self.direccion
        return marker2
    }
    
    
}
