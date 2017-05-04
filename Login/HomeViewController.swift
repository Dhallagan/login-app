//
//  LoginViewController.swift
//  Login
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    @IBOutlet var text: UITextView!
    
    var loggedInUser = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        debugPrint(loggedInUser)
        text.text! = loggedInUser["token"] as! String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(_ sender: UIButton){
        logOut()
    }
    
    func logOut(){
        LoginAPI.shared.logout()
        print("Logged out and token deleted")
        
        self.loggedInUser["token"] = ""
        
        debugPrint(loggedInUser)
        self.performSegue(withIdentifier: "showLogout", sender: self)
    }
    
    
}

