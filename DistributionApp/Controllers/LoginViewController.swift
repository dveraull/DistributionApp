//
//  LoginViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 30/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVie()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    
    // MARK: - Own Methods
    
    func initVie(){
        self.navigationController?.navigationBar.isHidden = true
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
