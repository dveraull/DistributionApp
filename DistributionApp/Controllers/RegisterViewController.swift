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
        if(txtName.text == ""){
            print("sin nombre")
            alertValidation("El Nombre esta vacio")
        }else if(txtDNI.text == ""){
            print("sin nombre")
            alertValidation("El DNI esta vacio")
        }else if(txtTelefono.text == ""){
            print("sin nombre")
            alertValidation("El Telefono esta vacio")
        }else if(txtDireccion.text == ""){
            print("sin nombre")
            alertValidation("La Direccion esta vacia")
        }else if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
            alertConfirm()
        } else {
            print("sin nombre")
            alertValidation("No Hay Localizacion")
           // self.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }
        
    }
    
    @IBAction func cancelItemButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertConfirm(/*_ cliente : Cliente*/){
        let alert = UIAlertController(title: "Confirmacion de Registro",
                                      message: "¿Confirma el registro?",
                                      preferredStyle: .alert)
        
        //Creamos el UIAlertAction que nos permitirá guardar la tarea
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        let mylocation = self.mapView.myLocation
                                        let customer = Custommer()
                                        customer.name=self.txtName.text
                                        customer.dni=Int(self.txtDNI.text!)
                                        customer.phone=Int(self.txtTelefono.text!)
                                        customer.address=self.txtDireccion.text
                                        let locacion = Location()
                                        locacion.latitude = mylocation!.coordinate.latitude
                                        locacion.longitude = mylocation!.coordinate.longitude
                                        customer.location=locacion
                                        //print(customer.address)
                                        RestApiData.sharedInstance.RegisterCustomer(customer: customer) { (customer, error) in
                                            //SVProgressHUD.dismiss()
                                            if(error == nil){
                                                //if(customer != nil){
                                                    print("se registro correctamente")
                                                    self.txtName.text=""
                                                    self.txtDNI.text=""
                                                    self.txtTelefono.text=""
                                                    self.txtDireccion.text=""
                                                    
                                                    self.dismiss(animated: true, completion: nil)
                                                /*}
                                                else{
                                                    print("Error")
                                                }*/
                                            }
                                        }
        })
        //Creamos el UIAlertAction que nos permitirá cancelar
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default) { (action: UIAlertAction) -> Void in}
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)    }
    
    func alertValidation(_ mensaje : String){
        let alert = UIAlertController(title: "Alerta",
                                      message: mensaje,
                                      preferredStyle: .alert)
        
        //Creamos el UIAlertAction que nos permitirá guardar la tarea
        let saveAction = UIAlertAction(title: "Aceptar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        

        })
        
        
        alert.addAction(saveAction)
        
        present(alert,
                animated: true,
                completion: nil)    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
