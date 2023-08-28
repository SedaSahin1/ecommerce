//
//  ConfirmationViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 24.08.2023.
//

import Foundation
import UIKit
import SnapKit

final class ConfirmationViewController: BaseViewController<ConfirmationViewModel> {
    
    private let confirmationText: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let confirmationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(toPayment), for: .touchUpInside)
        return button
    }()
    
    @objc func toPayment(){
        viewModel?.toPayment()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(confirmationText)
        view.addSubview(confirmationButton)
        makeConfirmationText()
        confirmationText.text = "Total Cost: \(String(describing: viewModel?.totalCost ?? 0))"
        makeConfirmationButton()
        
        viewModel?.updateUI = { [weak self] in
            let vc = ProductListViewController()
            vc.viewModel = ProductListViewModel()
            self?.navigationController?.pushViewController(vc, animated: true)        }
    }
    
    private func makeConfirmationText() {
        confirmationText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(240)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    private func makeConfirmationButton() {
        confirmationButton.snp.makeConstraints { make in
            make.top.equalTo(confirmationText.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
        }
    }
    
  
}
