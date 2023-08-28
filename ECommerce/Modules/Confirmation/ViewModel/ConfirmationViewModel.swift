//
//  ConfirmationViewModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 28.08.2023.
//


import Foundation
import Alamofire

class ConfirmationViewModel: ViewModel {
    var totalCost: Int?
    
    init(totalCost: Int?){
        self.totalCost = totalCost
    }
}

extension ConfirmationViewModel {
    
    func toPayment() {   // need payment API
       
        updateUI?()
        
    }
}
