//
//  AlamofireService.swift
//  ECommerce
//
//  Created by Seda Şahin on 23.08.2023.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
   func fetchAPIData() {
      let url = "https://dummyjson.com/products";
      AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
        .response{ resp in
            switch resp.result{
              case .success(let data):
                do{
                  let jsonData = try JSONDecoder().decode(Model.self, from: data!)
                  print(jsonData)
               } catch {
                  print(error.localizedDescription)
               }
             case .failure(let error):
               print(error.localizedDescription)
             }
        }
   }
}

