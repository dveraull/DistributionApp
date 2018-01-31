//
//  MapViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit
import GoogleMaps


class MapViewController: UIViewController {

    @IBOutlet weak var viewMapa: UIView!
    var clientes = [Cliente]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -8.127314, longitude: -79.042105, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true        // Do any additional setup after loading the view.
        viewMapa.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: viewMapa, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: viewMapa, attribute: .height, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: viewMapa, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: mapView, attribute: .centerY, relatedBy: .equal, toItem: viewMapa, attribute: .centerY, multiplier: 1, constant: 0)
        
        viewMapa.addConstraints([width,height,centerX,centerY])
        
        self.clientes.append(Cliente(1,"Diego Ferrari","-8.127314", "-79.042105","Calle Golondrinas","72980466", "967301026"))
        self.clientes.append(Cliente(2,"Ricardo Camus","-8.128859", "-79.037621","Av Fatima","72980465", "965454304"))
        for cliente in clientes{
            //let marker = GMSMarker()
            //marker = cliente.marcadorCliente()
            cliente.marcadorCliente().map = mapView
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
