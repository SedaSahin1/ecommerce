//
//  BasketViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 24.08.2023.
//

import Foundation
import UIKit
import Alamofire

final class BasketViewController: BaseViewController<BasketViewModel>, BasketItemDelegate {
    func addBasket() {
        viewModel?.addCart()
    }
    
    func removeBasket() {
        viewModel?.removeCart()
    }
    
    private let confirmationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirmation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(toConfirmation), for: .touchUpInside)
        return button
    }()
    
    @objc func toConfirmation(){
        let vc = ConfirmationViewController()
        vc.viewModel = ConfirmationViewModel(totalCost: viewModel?.results?.discountedTotal)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(confirmationButton)
        view.backgroundColor = .white
        self.navigationItem.title = "Basket"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BasketItemViewCell.self, forCellWithReuseIdentifier: BasketItemViewCell.Identifier.custom.rawValue)
        makeCollectionView()
        makeConfirmationButton()
        viewModel?.getBasket()
        viewModel?.updateUI = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func makeCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
          //  make.bottom.equalToSuperview()
        }
    }
    
    private func makeConfirmationButton() {
        confirmationButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
    }
    
}

extension BasketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.results?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BasketItemViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketItemViewCell.Identifier.custom.rawValue, for: indexPath) as! BasketItemViewCell
        cell.saveModel(model: (viewModel?.results?.products?[indexPath.row])!)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/2.3),
            height: (view.frame.size.height/3)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
