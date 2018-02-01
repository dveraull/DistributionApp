//
//  PerfilViewController.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 1/02/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var dniLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UniversalUser.sharedInstance.nombres != nil){
            self.nombreLabel.text = " \(UniversalUser.sharedInstance.apellidos!), \(UniversalUser.sharedInstance.nombres!)"
            self.emailLabel.text = UniversalUser.sharedInstance.correo
            self.dniLabel.text = UniversalUser.sharedInstance.usuario
        }
        // Do any additional setup after loading the view.
    }

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
