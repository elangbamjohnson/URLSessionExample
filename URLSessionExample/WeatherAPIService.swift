//
//  WeatherAPIService.swift
//  URLSessionExample
//
//  Created by Johnson Elangbam on 2/28/19.
//  Copyright © 2019 Johnson Elangbam. All rights reserved.
//
//http://api.wunderground.com/api/39c6d95e30243c4b/forecast/q/MI/Detroit.json
import Foundation

class WeatherAPIService {
    func executeWebRequest(urlToExecute: URL, completionHandler:@escaping ([String:Any]?,Error?)->Void)  {
        let sharedSession = URLSession.shared
        let webRequest = URLRequest(url: urlToExecute)
        let dataTask = sharedSession.dataTask(with: webRequest) { (webData, urlResponse, apiError) in
            
            guard let unwrappedData = webData else {
                completionHandler(nil, apiError)
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [String:Any]
                completionHandler(jsonResponse,nil)
                
            }catch {
                print(error.localizedDescription)
                completionHandler(nil, error)
                
            }
        }
        
        dataTask.resume()
    }
    
}

