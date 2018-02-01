//
//  DetailViewController.swift
//  DistributionApp
//
//  Created by Aceleradora Mobile Perú on 31/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var custommer:Custommer?

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    
    @IBOutlet weak var verMapaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     // MARK: - Actions
    
    @IBAction func verMapaButtonPressed(_ sender: Any) {
        
    }
    
    
    // MARK: - Own Methods
    func initView(){
        self.nombreLabel.text = self.custommer?.name
        self.dniLabel.text = "\(self.custommer?.dni)"
        self.telefonoLabel.text = "\(self.custommer?.phone)"
        self.direccionLabel.text = self.custommer?.address
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
