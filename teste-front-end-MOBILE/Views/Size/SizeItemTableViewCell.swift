//
//  SizeItemTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class SizeItemTableViewCell: UITableViewCell {
    
    static let identifier = "SizeItemTableViewCell"
    
    private lazy var radioButton: UIButton = {
        let e = UIButton(type: .system)
        e.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
        e.translatesAutoresizingMaskIntoConstraints = false
        e.addTarget(self, action: #selector(radioButtonHandler), for: .touchUpInside)
        return e
    }()
    
    private let productLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var priceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.font = UIFont.systemFont(ofSize: 16)
        return e
    }()
    
    private lazy var promoPriceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.font = UIFont.systemFont(ofSize: 12)
        e.isHidden = true
        return e
    }()
    
    private lazy var promoIconImageView: UIImageView = {
        let e = UIImageView()
        let image = UIImage(named: "promo")
        e.image = image
        e.isUserInteractionEnabled = false
        e.contentMode = .scaleAspectFit
        e.heightAnchor.constraint(equalToConstant: 22).isActive = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.bounds
    }
    
    public func configure(with size: ItemModel?) {
        productLabel.text = size?.itemTitle ?? String()
        
        guard size?.hasPromo == true else {
            priceLabel.text = "R$\(size?.price.toString())"
            promoPriceLabel.isHidden = true
            return
        }
        
        priceLabel.text = "R$\(size?.promoPrice.toString())"
        promoPriceLabel.text = "de R$\(size?.price.toString()) por"
        promoPriceLabel.isHidden = false
        
    }
    
    func setPromoConstraint() {
        contentView.addSubview(promoIconImageView)
        promoIconImageView.isHidden = false
        
        
    }
    
    func addComponents() {
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(promoPriceLabel)
        contentView.addSubview(radioButton)
        contentView.addSubview(promoIconImageView)
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if promoIconImageView.isHidden == false {
            NSLayoutConstraint.activate([
                radioButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
                radioButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor, constant: 1),
                
                promoIconImageView.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: 2),
                promoIconImageView.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor, constant: 1),
                
                productLabel.leadingAnchor.constraint(equalTo: promoIconImageView.trailingAnchor, constant: 2),
                
                productLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                productLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                
                priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
                priceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor),
                
                promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
                promoPriceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor)
            ])
            return
        }
        
        promoIconImageView.removeFromSuperview()
        NSLayoutConstraint.activate([
            radioButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            radioButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor, constant: 1),
            
            productLabel.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: 5),
            
            productLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            productLabel.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: 8),
            productLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor),
            
            promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            promoPriceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor)
        ])
        
    }
    
}

extension SizeItemTableViewCell {
    
    @objc
    func radioButtonHandler(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: "radio-unselected") {
            sender.setBackgroundImage(UIImage(named: "radio-selected"), for: .normal)
            return
        }
        sender.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
    }
    
}
