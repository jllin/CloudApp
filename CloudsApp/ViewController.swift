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

