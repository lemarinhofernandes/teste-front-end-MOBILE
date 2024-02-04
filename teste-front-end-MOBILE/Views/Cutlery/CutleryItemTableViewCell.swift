//
//  CutleryItemTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class CutleryItemTableViewCell: UITableViewCell {
    
    static let identifier = "CutleryItemTableViewCell"

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
    
    func configure(with cutleries: ItemModel?) {
        productLabel.text = cutleries?.itemTitle ?? String()
        
        guard cutleries?.hasPromo == true else {
            priceLabel.text = "+R$\(cutleries?.price.toString())"
            promoPriceLabel.isHidden = true
            return
        }
        
        priceLabel.text = "+R$\(cutleries?.promoPrice.toString())"
        promoPriceLabel.text = "de R$\(cutleries?.price.toString()) por"
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

extension CutleryItemTableViewCell {
    
    @objc
    func radioButtonHandler(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: "radio-unselected") {
            sender.setBackgroundImage(UIImage(named: "radio-selected"), for: .normal)
            return
        }
        sender.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
    }
    
}
