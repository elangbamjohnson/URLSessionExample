//
//  WeatherAPIService.swift
//  URLSessionExample
//
//  Created by Johnson Elangbam on 2/28/19.
//  Copyright © 2019 Johnson Elangbam. All rights reserved.
//

import Foundation

class WeatherAPIService {
    func executeWebRequest(urlToExecute: URL, completionHandler:@escaping ([String:Any]?,Error?)->Void)  {
        
//        let defaultSession = URLSession(configuration: .default)
//        let webRequest = URLRequest(url: urlToExecute)
        let dataTask = URLSession.shared.dataTask(with: urlToExecute) { (webData, urlResponse, apiError) in
            
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completionHandler(nil,apiError)
                    return
            }
            
//            guard let unwrappedData = webData else {
//                completionHandler(nil, apiError)
//                return
//            }
    
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

