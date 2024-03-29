//
//  DrinkItemTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class DrinkItemTableViewCell: UITableViewCell {
    
    struct Constants {
        static let minusButton = "disabledMinusButton"
        static let plusButton = "plusButton"
    }
    
    static let identifier = "DrinkItemTableViewCell"

    private lazy var minusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setBackgroundImage(UIImage(named: Constants.minusButton), for: .normal)
        e.translatesAutoresizingMaskIntoConstraints = false
        e.heightAnchor.constraint(equalToConstant: 24).isActive = true
        e.widthAnchor.constraint(equalToConstant: 24).isActive = true
        e.tintColor = .AIQTeal()
        e.addTarget(self, action: #selector(minusButtonHandler), for: .touchUpInside)
        return e
    }()
    
    private lazy var plusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(named: Constants.plusButton), for: .normal)
        e.translatesAutoresizingMaskIntoConstraints = false
        e.tintColor = .AIQTeal()
        e.heightAnchor.constraint(equalToConstant: 28).isActive = true
        e.widthAnchor.constraint(equalToConstant: 28).isActive = true
        e.addTarget(self, action: #selector(plusButtonHandler), for: .touchUpInside)
        return e
    }()
    
    private lazy var drinkAmountLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.text = "0"
        e.font = .AIQProductSubtitle3()
        e.textColor = .AIQDarkGray()
        return e
    }()
    
    let productLabel: UILabel = {
        let e = UILabel()
        e.font = .AIQproductDescription()
        e.textColor = .AIQNeutralGray2()
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var priceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.font = UIFont.AIQProductSubtitle3()
        e.textColor = UIColor.AIQMainPurple()
        return e
    }()
    
    private lazy var promoPriceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.font = UIFont.systemFont(ofSize: 12)
        e.isHidden = false
        return e
    }()
    
    weak var delegate: QuantityButtonsDelegate?
    private var price: Double = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.bounds
    }
    
    func configure(with drink: ItemModel?) {
        guard let drink = drink else { return }
        
        productLabel.text = drink.itemTitle ?? String()
        
        guard drink.hasPromo == true else {
            priceLabel.text = drink.price?.toPlusCurrencyString()
            priceLabel.text = drink.price?.toPlusCurrencyString()
            promoPriceLabel.isHidden = true
            self.price = drink.price ?? 0
            return
        }
        priceLabel.text = drink.promoPrice.toPlusCurrencyString()
        promoPriceLabel.text = "de \(drink.price?.toCurrenryString())) por"
        promoPriceLabel.isHidden = false
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(promoPriceLabel)
        contentView.addSubview(minusButton)
        contentView.addSubview(drinkAmountLabel)
        contentView.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            minusButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
            drinkAmountLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 12),
            drinkAmountLabel.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
            plusButton.leadingAnchor.constraint(equalTo: drinkAmountLabel.trailingAnchor, constant: 12),
            plusButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
            productLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            productLabel.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 8),
            productLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
            promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            promoPriceLabel.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor)
        ])
        
    }

}


extension DrinkItemTableViewCell {
    
    @objc
    func minusButtonHandler(_ sender: UIButton) {
        guard let productLabel = self.productLabel.text else { return }
        delegate?.minusButton(sender, self.drinkAmountLabel, productLabel)
    }
    
    @objc
    func plusButtonHandler() {
        guard let productLabel = self.productLabel.text else { return }
        delegate?.plusButton(self.minusButton, self.drinkAmountLabel, productLabel, self.price, priceLabel)
    }
    
}
