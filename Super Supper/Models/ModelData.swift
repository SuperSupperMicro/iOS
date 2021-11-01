//
//  ModelData.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/29/21.
//

import Foundation
//
//final class ModelData: ObservableObject {
//    var recipes: [Recipe]
//    
//}
//
//func apiCall<T: Decodable> (_ urls: String) -> T {
//    let data: Data
//    
//    let url = URL(string: urls)!
    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                self.handleClientError(error)
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                (200...299).contains(httpResponse.statusCode) else {
//                self.handleServerError(response)
//                return
//            }
//            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
//                let data = data,
//                let string = String(data: data, encoding: .utf8) {
//                DispatchQueue.main.async {
//                    self.webView.loadHTMLString(string, baseURL: url)
//                }
//            }
//        }
//        task.resume()
    
    
//    func startLoad() {
//        
//    }
//}
