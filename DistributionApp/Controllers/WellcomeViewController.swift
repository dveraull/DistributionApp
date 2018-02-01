//
//  WellcomeViewController.swift
//  DistributionApp
//
//  Created by Jordan Capa on 1/02/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class WellcomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UniversalUser.sharedInstance.nombres != nil){
            self.usernameLabel.text = UniversalUser.sharedInstance.nombres
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func exitButtonPressed(_ sender: Any) {
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
