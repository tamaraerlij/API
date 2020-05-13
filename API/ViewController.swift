//
//  ViewController.swift
//  API
//
//  Created by Tamara Erlij on 13/05/20.
//  Copyright © 2020 Tamara Erlij. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
   
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func submit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=439d4b804bc8187953eb36d2a8c26a02")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                if let urlContent = data{
                    
                    do  {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as  AnyObject
                        print(jsonResult)
                        print(jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            print(description)
                        }
                    } catch {
                        print("JSON Processing Failed")
                    }
                
            }
        }
    }
        task.resume()
    }
}

