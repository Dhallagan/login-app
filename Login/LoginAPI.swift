//
//  LoginAPI2.swift
//  Login
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//
//Routes
// luitelsubash@gmail.com
// 443-856-5567
// Subash Luitel

import UIKit
import Alamofire

class LoginAPI {
    static let shared = LoginAPI()
    
    private static let baseUrlString = "http://localhost:3000"
    
    
    let signupURL = "http://localhost:3000/signup"
    let loginURL = "http://localhost:3000/login"
    
    var accessToken = String()
    
//    func post(parameters: parameters){
//        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
//        
//        let request = Alamofire.request(signupURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//        request.responseJSON(completionHandler: { (response) in
//            debugPrint(response)
//            if let responseDic = response.value as? [String : Any] {
//                return completion(responseDic, nil)
//            } else {
//                return completion(nil, response.error)
//            }
//        })
//    }
//    
    
    func signupPost(name: String, email: String, password: String,  completion: @escaping (_ userInfo: [String : Any]?, _ error: [String : Any]?) -> Void) {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let parameters: Parameters = ["name": "\(name)","email": "\(email)","password": "\(password)"]
        Alamofire.request(signupURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                if response.response?.statusCode == 200 {
                    print("Success with JSON: \(response.result.value!)")
                    if let responseDic = response.value as? [String : Any] {
                        debugPrint(responseDic)
                        return completion(responseDic, nil)
                    }
                } else {
                    print("SIGNUP_FAILURE with JSON: \(response.result.value!)")

                    if let error = response.result.value as? [String: Any] {
                        //If you want array of task id you can try like
                        return completion(nil, error)
                    }
                }
            }

    }
    
    func loginPost(email: String, password: String, completion: @escaping (_ userInfo: [String : Any]?, _ error: [[String : Any]]?) -> Void) {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let parameters: Parameters = ["email": "\(email)","password": "\(password)"]
        
        Alamofire.request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                if response.response?.statusCode == 200 {
                    print("LOGIN_SUCCESS with JSON: \(response.result.value!)")
                    if let responseDic = response.value as? [String : Any] {
                        self.accessToken = responseDic["token"] as! String
                        print(self.accessToken)
                        
                        return completion(responseDic, nil)
                    }
                } else {
                    print("LOGIN_FAILURE with JSON: \(response.result.value!)")
                    
                    if let error = response.result.value as? [[String: Any]] {
                        //If you want array of task id you can try like
                        return completion(nil, error)
                    }
                }
        }
    }
    
    func logout(){
        self.accessToken = ""
    }
    
   
    
}
