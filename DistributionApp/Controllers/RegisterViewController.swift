//
//  RegisterViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit
import GoogleMaps

class RegisterViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDNI: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var mapaLoc: UIView!
    var mapView: GMSMapView = GMSMapView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -8.127314, longitude: -79.042105, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true        // Do any additional setup after loading the view.
        mapaLoc.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: mapaLoc, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: mapaLoc, attribute: .height, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: mapaLoc, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: mapView, attribute: .centerY, relatedBy: .equal, toItem: mapaLoc, attribute: .centerY, multiplier: 1, constant: 0)
        
        mapaLoc.addConstraints([width,height,centerX,centerY])
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions

    @IBAction func registerButtonPressed(_ sender: Any) {
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
           // self.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }
        
    }
    
    @IBAction func cancelItemButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
