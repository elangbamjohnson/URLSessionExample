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
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func fetchWeather(_ sender: Any) {
//        let url = URL(string:"http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/MI/Detroit.json")
        
        let url = URL(string:"http://somecrazybitch.orecast/q/MI/D")
        
        apiService.executeWebRequest(urlToExecute: url!) { (responseDict, error) in
            DispatchQueue.main.async {
                
                if let unwrappedError = error {
                    print(unwrappedError.localizedDescription)
                }
                self.textView.text = responseDict?.description
            }
        }
    }
}

