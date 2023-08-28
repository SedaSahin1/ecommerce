//
//  LoginViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 23.08.2023.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private var results: LoginModel?
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.red
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toProductList), for: .touchUpInside)
        return button
    }()
    
    @objc func toProductList(){
        
        viewModel?.login(userName: "kminchelle", password: "0lelplR")

    }

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.placeholder = "Password"
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.placeholder = "Username"
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.textAlignment = .left
        return textField
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        passwordTextField.text = "0lelplR"  // API test user
        usernameTextField.text = "kminchelle"
        setup()
        viewModel?.updateUI = { [weak self] in
            if self?.viewModel?.success == true {
                let vc = ProductListViewController()
                vc.viewModel = ProductListViewModel()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    private func setup() {
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        usernameTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(120)
            make.right.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
        }

        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalTo(usernameTextField.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
        }

        loginButton.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
        }
    }
}



