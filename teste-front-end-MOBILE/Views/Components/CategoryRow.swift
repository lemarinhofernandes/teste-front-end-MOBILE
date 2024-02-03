//
//  CategoryRow.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class CategoryRow: UIView {
    
    private let productLabel: UILabel = {
        let e = UILabel()
        e.text = ""
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var priceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.text = ""
        e.font = UIFont.systemFont(ofSize: 12)
        return e
    }()
    
    private lazy var promoPriceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.text = ""
        e.font = UIFont.systemFont(ofSize: 12)
        e.isHidden = true
        return e
    }()
    
    private var selectButton = SelectButton(category: .onlyOne, delegate: nil, id: 0)
    private var price: Double = 0
    private var promoPrice: Double? = 0
    
    
    init(id: Int, title: String, hasPromo: Bool, price: Double, promoPrice: Double?, category: CategoryTypeEnum, delegate: SelectButtonDelegate?) {
        super.init(frame: .zero)
        self.selectButton = SelectButton(category: category, delegate: delegate, id: id)
        self.productLabel.text = title
        self.price = price
        self.promoPrice = promoPrice
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(selectButton)
        self.addSubview(productLabel)
        self.addSubview(priceLabel)
        self.addSubview(promoPriceLabel)
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            selectButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            selectButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -10),
            
            productLabel.leadingAnchor.constraint(equalTo: self.selectButton.trailingAnchor, constant: 4),
            productLabel.centerYAnchor.constraint(equalTo: self.selectButton.centerYAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 10),
            priceLabel.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor),
            
            promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            promoPriceLabel.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor)
        ])
        
        setPrice()
        
    }
    
}

extension CategoryRow {
    func setPrice() {
        guard let promoPrice = promoPrice else {
            self.priceLabel.text = "R$\(String(describing: price))"
            return
        }
        priceLabel.text = "R$\(String(describing: promoPrice))"
        promoPriceLabel.text = "de R$\(String(describing: price)) por "
        promoPriceLabel.isHidden = false
    }
}
