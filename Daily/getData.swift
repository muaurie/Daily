//
//  getData.swift
//  Daily
//
//  Created by Cherish Spikes on 5/7/23.
//

import Foundation

/* func getData() {
     let headers = [
         "X-RapidAPI-Key": "31f33d7124mshef0008f1b1aab13p1df760jsnc6621d9874b6",
         "X-RapidAPI-Host": "healthruwords.p.rapidapi.com"
     ]

     let request = NSMutableURLRequest(url: NSURL(string: "https://healthruwords.p.rapidapi.com/v1/quotes/?t=Wisdom&maxR=1&size=medium&id=731")! as URL,
                                             cachePolicy: .useProtocolCachePolicy,
                                     timeoutInterval: 10.0)
     request.httpMethod = "GET"
     request.allHTTPHeaderFields = headers

     let session = URLSession.shared
     let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
         if (error != nil) {
             print(error as Any)
         } else {
             if let responseData = data {
                 do {
                     let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                     if let responseDict = json as? [String: Any], let quote = responseDict["content"] as? String {
                         // update the label with the quote
                         DispatchQueue.main.async {
                             self.quoteLabel.text = quote
                         }
                     }
                 } catch let error {
                     print("Error parsing response data: \(error.localizedDescription)")
                 }
             }
         }
     })

     dataTask.resume()
 } */
