//
//  MapViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire

class MapViewController: UIViewController {

    @IBOutlet weak var viewMapa: UIView!
    var clientes = [Cliente]()
    var jsonArray: NSArray?
    var mapView = GMSMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -8.127314, longitude: -79.042105, zoom: 14.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true        // Do any additional setup after loading the view.
        viewMapa.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: viewMapa, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: viewMapa, attribute: .height, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: viewMapa, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: mapView, attribute: .centerY, relatedBy: .equal, toItem: viewMapa, attribute: .centerY, multiplier: 1, constant: 0)
        
        viewMapa.addConstraints([width,height,centerX,centerY])
        /*
        self.clientes.append(Cliente(1,"Diego Ferrari","-8.127314", "-79.042105","Calle Golondrinas","72980466", "967301026"))
        self.clientes.append(Cliente(2,"Ricardo Camus","-8.128859", "-79.037621","Av Fatima","72980465", "965454304"))
        for cliente in clientes{
            //let marker = GMSMarker()
            //marker = cliente.marcadorCliente()
            cliente.marcadorCliente().map = mapView
        }*/
        servicioClientes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func servicioClientes(){
        //1.
        Alamofire.request("https://private-96a29a-distributtion.apiary-mock.com/clientes") .responseJSON { response in
            //2.
            if let JSON = response.result.value{
                //3.
                self.mapView.clear()
                self.jsonArray = JSON as? NSArray
                //4.
                for item in self.jsonArray! as! [NSDictionary]{
                    //5.
                    let idcliente = item["idcliente"] as? Int
                    let nombre = item["nombres"] as? String
                    let dni = item["dni"] as? String
                    let direccion = item["direccion"] as? String
                    let x = item["x"] as? String
                    let y = item["y"] as? String
                    let telefono = item["telefono"] as? String
                    self.clientes.append(Cliente(idcliente!, nombre!, x!, y!, direccion!, dni!, telefono!))
                    //self.nameArray.append((name)!)
                    //self.imageURLArray.append((imageURL)!)
                }
                //6.
                //self.tableView.reloadData()
                for cliente in self.clientes{
                    //let marker = GMSMarker()
                    //marker = cliente.marcadorCliente()
                    cliente.marcadorCliente().map = self.mapView
                }
                
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
