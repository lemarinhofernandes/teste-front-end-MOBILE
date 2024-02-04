//
//  AditionalItemTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class AditionalItemTableViewCell: UITableViewCell {
    
    static let identifier = "AditionalItemTableViewCell"
    
    struct Constants {
        static let squareButton = "square"
        static let selectedSquareButton = "checkmark.square.fill"
    }

    private lazy var radioButton: UIButton = {
        let e = UIButton(type: .system)
        e.setBackgroundImage(UIImage(systemName: Constants.squareButton), for: .normal)
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
        e.font = UIFont.systemFont(ofSize: 12)
        return e
    }()
    
    private lazy var promoPriceLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.font = UIFont.systemFont(ofSize: 12)
        e.isHidden = true
        return e
    }()

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
    
    func configure(with aditional: ItemModel?) {
        productLabel.text = aditional?.itemTitle ?? String()
        
        guard aditional?.hasPromo == true else {
            priceLabel.text = "+R$\(aditional?.price.toString())"
            promoPriceLabel.isHidden = true
            return
        }
        
        priceLabel.text = "+R$\(aditional?.promoPrice.toString())"
        promoPriceLabel.text = "de R$\(aditional?.price.toString()) por"
        promoPriceLabel.isHidden = false
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(promoPriceLabel)
        contentView.addSubview(radioButton)
        
        NSLayoutConstraint.activate([
            radioButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            radioButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
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

extension AditionalItemTableViewCell {
    
    @objc
    func radioButtonHandler(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(systemName: Constants.squareButton) {
            sender.setBackgroundImage(UIImage(systemName: Constants.selectedSquareButton), for: .normal)
            return
        }
        sender.setBackgroundImage(UIImage(systemName: Constants.squareButton), for: .normal)
    }
    
}
