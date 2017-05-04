//
//  User.swift
//  Login
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import Foundation

class User {
    var name: String
    var email: String
    var token: String
    var id: String
   
    
    
    init(firstName: String,  email:String, token: String, id: String){
        self.name = firstName
        self.email = email
        self.token = token
        self.id = id
    }   
}
