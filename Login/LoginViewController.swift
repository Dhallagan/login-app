//
//  LoginViewController.swift
//  Login
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var msg: UILabel!
    
    var loggedInUser = [String:Any]()



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(_ sender: UIButton){
        login()
    }

    func login() {
        
        LoginAPI.shared.loginPost(email: email.text!, password: password.text! ) { (userInfo, error) in
            
            if(userInfo != nil){
                debugPrint(userInfo)
                self.loggedInUser = userInfo as! [String: Any]
                
                self.performSegue(withIdentifier: "showHome", sender: self)
            } else {
                print("Here: \(error)")
                
//               var errorMessages = String()
//                for i in 0...error!.count-1 {
//                    
//                
//                    var messages = error![i]["msg"]
//                        errorMessages.append("\(messages)\n")
//                    
//                }
                let alertController = UIAlertController(title: "Registration", message:
                    "Invalid username or password", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHome" {
            
            let homeViewController = segue.destination as! HomeViewController
                homeViewController.loggedInUser = loggedInUser
        }
    }
    
        
}

