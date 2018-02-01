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

    @IBOutlet weak var mapaPrinc: UIView!
    var custommers:[Custommer] = []
    var mapView = GMSMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //INICIALIZAR EL MAPA
        let camera = GMSCameraPosition.camera(withLatitude: -8.127314, longitude: -79.042105, zoom: 14.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapaPrinc.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: mapaPrinc, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: mapaPrinc, attribute: .height, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: mapaPrinc, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: mapView, attribute: .centerY, relatedBy: .equal, toItem: mapaPrinc, attribute: .centerY, multiplier: 1, constant: 0)
        mapaPrinc.addConstraints([width,height,centerX,centerY])
        self.initView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let userDefaults = UserDefaults.standard
        
        if !userDefaults.bool(forKey: "tutorial") {
            userDefaults.set(true, forKey: "tutorial")
            userDefaults.synchronize()
            performSegue(withIdentifier: "showWellcomeView", sender: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView(){
        //SVProgressHUD.show()
        RestApiData.sharedInstance.getCustommers { (custommers, error) in
           // SVProgressHUD.dismiss()
            if(custommers != nil){
                self.custommers = custommers!
                //self.tableView.reloadData()
                for customer in self.custommers{
                    //let marker = GMSMarker()
                    //marker = cliente.marcadorCliente()
                    //cliente.marcadorCliente().map = self.mapView
                    customer.markerCustomer().map = self.mapView
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
