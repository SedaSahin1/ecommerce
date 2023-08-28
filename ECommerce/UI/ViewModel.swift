//
//  ViewModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 27.08.2023.
//

import Foundation

public class ViewModel: NSObject {

    deinit {
        let type = Swift.type(of: self)
        print("\(type) DEALLOCATED")
    }

    var updateUI: (() -> Void)?

}
