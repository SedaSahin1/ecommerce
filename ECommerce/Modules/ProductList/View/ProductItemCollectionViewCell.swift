//
//  ProductItemCollectionViewCell.swift
//  ECommerce
//
//  Created by Seda Şahin on 23.08.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol ProductItemDelegate: AnyObject {
    func addBasket()
    func removeBasket()
}

class ProductItemCollectionViewCell: UICollectionViewCell {

    enum Identifier: String {
        case custom = "ProductItemCollectionViewCell"
    }
    
    var delegate: ProductItemDelegate?
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    private let randomImage: String = "https://picsum.photos/200/300"
    private let addItem: UIButton = {
        let button = UIButton(type: .system)
  
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(addBasket), for: .touchUpInside)

        return button
    }()
    
    
    private let stockLabel: UILabel = UILabel()
    
    
    @objc func addBasket(){
      print("add")
        delegate?.addBasket()
    }
    
    @objc func deleteBasket(){
      print("delete")
        delegate?.removeBasket()
    }
    
    
    private let deleteItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(deleteBasket), for: .touchUpInside)

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
   
    
    private func configure(){
        addSubviews()
        drawDesign()
        makeImageView()
        makeNameLabel()
        makePriceLabel()
        makeAddItem()
        makeDeleteItem()
        makeStockLabel()
    }
    
    func saveModel(model: Products) {
        nameLabel.text = model.title
        priceLabel.text = "$\(model.price ?? 0.0)"
        stockLabel.text = "\(model.stock ?? 0)"
        imageView.kf.setImage(with: URL(string: model.images?[0] ?? randomImage))
    }
    
    private func drawDesign() {
        nameLabel.numberOfLines = 2
        priceLabel.font = .systemFont(ofSize: 14)
        imageView.contentMode =  .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
       
    
       
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addItem)
        contentView.addSubview(deleteItem)
        contentView.addSubview(stockLabel)
    }
}

extension ProductItemCollectionViewCell {
    
    private func makeStockLabel() {
        stockLabel.snp.makeConstraints{ make in
            make.left.equalTo(imageView).offset(3)
            make.top.equalTo(imageView.snp.bottom)
        }
    }
    
    private func makeImageView() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-105)
        }
    }
    
    private func makeNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(stockLabel.snp.bottom)
           make.left.equalTo(imageView).offset(3)
         //   make.right.equalTo(imageView)
        }
    }
    
    private func makePriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
           // make.bottom.equalTo(contentView)
            make.left.equalTo(nameLabel)
        }
    }
    
    private func makeAddItem() {
        addItem.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.bottom.equalTo(contentView)
            make.left.equalTo(nameLabel)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
    
    private func makeDeleteItem() {
        deleteItem.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
}
