//
//  ViewController.swift
//  URLSessionExample
//
//  Created by Johnson Elangbam on 2/28/19.
//  Copyright © 2019 Johnson Elangbam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let apiService = WeatherAPIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/MI/Detroit.json")
        
        apiService.executeWebRequest(urlToExecute: url!) { (responseDict, error) in
            print(responseDict)
        }
    }


}

