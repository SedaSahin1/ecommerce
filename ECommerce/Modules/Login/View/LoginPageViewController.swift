//
//  LoginPageViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 27.08.2023.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "E-Commerce App"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 45, weight: .thin)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        makeLabel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let vc = LoginViewController()
            vc.viewModel = LoginViewModel()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func makeLabel() {
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
}
