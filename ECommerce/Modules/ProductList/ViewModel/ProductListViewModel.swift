//
//  ProductListViewModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 28.08.2023.
//

import Foundation
import Alamofire

class ProductListViewModel: ViewModel {
    var results: Model?
    var cartAdded: BasketModel?
    var cartRemoved: BasketModel?
}

extension ProductListViewModel {
    
    func getProducts() {
        let url = "https://dummyjson.com/products"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(Model.self, from: data!)
                    print(jsonData)
                      self.results = jsonData
                      self.updateUI?()
                 } catch {
                    print(error.localizedDescription)
                 }
               case .failure(let error):
                 print(error.localizedDescription)
               }
          }
    }
    
    func addCart(){
        let url = "https://dummyjson.com/carts/add"
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(BasketModel.self, from: data!)
                    print(jsonData)
                      self.cartAdded = jsonData
                      self.updateUI?()
                 } catch {
                    print(error.localizedDescription)
                 }
               case .failure(let error):
                 print(error.localizedDescription)
               }
          }
    }
    
    func removeCart(){
        let url = "https://dummyjson.com/carts/1"
        AF.request(url, method: .delete, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(BasketModel.self, from: data!)
                    print(jsonData)
                      self.cartRemoved = jsonData
                      self.updateUI?()
                 } catch {
                    print(error.localizedDescription)
                 }
               case .failure(let error):
                 print(error.localizedDescription)
               }
          }
    }
}
