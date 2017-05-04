//
//  ViewController.swift
//  Login
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    
    func exit() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: AnyObject) {
        // Code for registering the user
        LoginAPI.shared.signupPost(name: name.text!, email: email.text!, password: password.text! ) { (userInfo, error) in
            
            if(userInfo != nil){
                print(userInfo)
                    self.performSegue(withIdentifier: "showLogin", sender: self)
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
}
