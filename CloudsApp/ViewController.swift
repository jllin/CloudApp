//
//  ViewController.swift
//  CloudsApp
//
//  Created by Jllin on 2017/7/24.
//  Copyright © 2017年 jllin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://api.github.com/users/octocat/repos").responseJSON { response in
            
            if let resultValue = response.result.value {
                print(resultValue)
                
                if let array = resultValue as? [Any] {
                    
                    if let JSON_OBJECT = array.first {
                        if let dictionary = JSON_OBJECT as? [String: Any] {
                            if let value = dictionary["id"] as? Int {
                                print("id: \(value)")
                            }
                            if let value = dictionary["name"] as? String {
                                print("name: \(value)")
                            }
                            if let value = dictionary["private"] as? Bool {
                                print("private: \(value)")
                            }
                            if let value = dictionary["homepage"] as? String {
                                print("homepage: \(value)")
                            }
                            else
                            {
                                print("homepage: null")
                            }
                            
                            
                            for (key, value) in dictionary {
                                if let strValue = value as? Any {
                                    print("****key(\(key)):\(strValue)\n")
                                }
                                else
                                {
                                    print("****key(\(key)): null")
                                }
                            }
                        }
                        

                        
                    }
                }
                
                
                
            }
        }
        print("==========================")
        
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in

            print ("request==>\n\(response.request)\n" as Any)
            print ("response==>\n\(response.response)\n" as Any)
            print ("data==>\n\(response.data)\n" as Any)
            print ("result==>\n\(response.result)\n")
            
            //if let ARRAY = response.result.value
            //{
            //    print("ready to print the result values...\n\(ARRAY)")
                
            
            
            
            
            
            
                if let JSON = response.result.value {
                    
                    if let dectionary = JSON as? [String: Any] {
                        
                        if let value = dectionary["origin"] as? String {
                            print("key(origi):\(value)\n")
                        }

                        if let value = dectionary["url"] as? String {
                            print("key(url):\(value)\n")
                        }
                        
                        if let headers = dectionary["headers"] as?  [String: Any]
                        {
                            /*
                            if let value = headers["Accept-Encoding"] as? String {
                                print("key(Accept-Encoding):\(value)\n")
                            }
                            if let value = headers["Accept"] as? String {
                                print("key(Accept):\(value)\n")
                            }
                            if let value = headers["Accept-Language"] as? String {
                                print("key(Accept-Language):\(value)\n")
                            }
                            if let value = headers["Connection"] as? String {
                                print("key(Connection):\(value)\n")
                            }
                            if let value = headers["Cookie"] as? String {
                                print("key(Cookie):\(value)\n")
                            }
                            if let value = headers["Dnt"] as? String {
                                print("key(Dnt):\(value)\n")
                            }
                            if let value = headers["Host"] as? String {
                                print("key(Host):\(value)\n")
                            }
                            if let value = headers["Agent"] as? String {
                                print("key(Agent):\(value)\n")
                            }
                            if let value = headers["Upgrade-Insecure-Requests"] as? String {
                                print("key(Upgrade-Insecure-Requests):\(value)\n")
                            }
                            */
                            
                            for (key, value) in headers {
                                if let strValue = value as? String {
                                    print("key(\(key)):\(strValue)\n")
                                }
                            }
                        }
                    }
                }
            //}
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

