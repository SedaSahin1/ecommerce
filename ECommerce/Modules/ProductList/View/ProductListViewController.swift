//
//  ProductListViewController.swift
//  ECommerce
//
//  Created by Seda Şahin on 23.08.2023.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

final class ProductListViewController : BaseViewController<ProductListViewModel>, ProductItemDelegate {
    func addBasket() {
        viewModel?.addCart()
    }
    
    func removeBasket() {
        viewModel?.removeCart()
    }
    
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let basketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Basket", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(toBasket), for: .touchUpInside)
        return button
    }()
   
    @objc func toBasket(){
        let vc = BasketViewController()
        vc.viewModel = BasketViewModel()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(basketButton)
        view.backgroundColor = .white
        self.navigationItem.title = "Product List"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductItemCollectionViewCell.self, forCellWithReuseIdentifier: ProductItemCollectionViewCell.Identifier.custom.rawValue)
        makeCollectionView()
        makeBasketButton()
        viewModel?.getProducts()
        viewModel?.updateUI = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func makeCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
           // make.bottom.equalToSuperview()
        }
    }
    
    private func makeBasketButton() {
        basketButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
    }
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.results?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCollectionViewCell.Identifier.custom.rawValue, for: indexPath) as! ProductItemCollectionViewCell
        cell.delegate = self
        cell.saveModel(model: (viewModel?.results?.products?[indexPath.row])!)
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
