//
//  Utils.swift
//  miclaroApp
//
//  Created by Jordan Capa on 29/01/18.
//  Copyright © 2018 Aceleradora Mobile Peru. All rights reserved.
//

import UIKit

class Utils{
    
    static func isValidEmail(_ email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func showBasicAlert(title:String?, message:String?, view:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    static func isStringAnDouble(string: String) -> Bool {
        return Double(string) != nil
    }
}
