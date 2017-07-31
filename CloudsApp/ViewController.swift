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
            /*
            guard let result_value = response.result.value
                else {
                    return
            } //用 guard let 取代第一層 if ..『if let resultValue = response.result.value』
            guard let array = result_value as? [Any]
                else {
                    return
            } //用 guard let 取代第二層 if ..『if let array = result_value as? [Any] 』
            */
            
            guard let result_value = response.result.value,
                let array = result_value as? [Any]
                else {
                    return
            } //一層以上 guard let 的合併寫法

            
            
            //  這層拿掉用 guard let 取代  (第一層)
            //if let resultValue = response.result.value {
                print(result_value)
            
                //  這層拿掉用 guard let 取代  (第二層)
                //if let array = result_value as? [Any] {
                    
                    //===============
                    // 又用 guard 取代了一層 if let ... 『dictionary = JSON_OBJECT as? [String: Any]』
                    if let JSON_OBJECT = array.first {
                        guard let dictionary = JSON_OBJECT as? [String: Any]
                            else {
                                return
                        }
                        // 又被 guard let 取代了一層 if let ...
                        //if let dictionary = JSON_OBJECT as? [String: Any] {
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
                                print("****key(\(key)):\(value)\n")
                                /*
                                if let strValue = value as? Any {
                                    print("****key(\(key)):\(strValue)\n")
                                }
                                else
                                {
                                    print("****key(\(key)): null")
                                }
                                 */
                            }
                        }
                    //}
                }
                //===============
            //}    //  這層拿掉用 guard let 取代 (第二層)
        //}    //  這層拿掉用 guard let 取代 (第一層)
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

