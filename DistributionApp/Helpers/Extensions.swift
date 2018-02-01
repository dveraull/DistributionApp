//
//  Extensions.swift
//  miclaroApp
//
//  Created by Aceleradora Mobile Peru on 9/01/18.
//  Copyright © 2018 Aceleradora Mobile Peru. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension String {
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    var isFormatValidEmail: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9@._-]+", options: .regularExpression) == nil
    }
    var isFormatName: Bool {
        return !isEmpty && range(of: "[^a-zñáéíóúA-ZÑÁÉÍÓÚ ]+", options: .regularExpression) == nil
    }
    var isNumeric:Bool {
        return !isEmpty && range(of: "[^[0-9]]", options: .regularExpression) == nil
    }
    var isOnlyNumeric:Bool {
        return !isEmpty && range(of: "[^[0-9]]", options: .regularExpression) == nil
    }
    var isFormatUsername:Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

extension UITextField{
    func setBottomBorderColor(){
        self.borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor(red: 0.0/255, green: 150.0/255, blue: 175.0/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func setBorderError(){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
    }
    func hiddeBorder(){
        self.layer.borderWidth = 0.0
    }
}

extension UIImageView{
    func setImageFromURl(stringImageUrl url: String){
        let url = URL(string: url)
        let urlRequest = URLRequest(url: url!)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        session.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
}

extension UIView{
    
    func asRounded(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 2;
    }
    
    func asCircle(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2;
    }
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

