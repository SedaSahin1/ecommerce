//
//  LoginViewModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 27.08.2023.
//

import Foundation
import Alamofire

class LoginViewModel: ViewModel {
    var success: Bool?
}

extension LoginViewModel {
    
    func login(userName: String, password: String) {
        
        let urlString = "https://dummyjson.com/auth/login";
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let parameters: Parameters = [
            "username": userName, //  loginTextField.text ?? "", // "kminchelle",
            "password": password // passwordTextField.text ?? ""// "0lelplR"
            ]
        let data = try! JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)

        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    if let json = json {
                        print(json)
                    }
        request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
        
        
        
        AF.request(request)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(LoginModel.self, from: data!)
                    print(jsonData)
                   //   self.results = jsonData
                      self.success = true
                      self.updateUI?()
//                      let vc = ProductListViewController()
//                      self.navigationController?.pushViewController(vc, animated: true)
                 } catch {
                    print(error.localizedDescription)
                 }
               case .failure(let error):
                 print(error.localizedDescription)
               }
          }
    }
}
