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
    
    private lazy var squareButton: UIButton = {
        let e = UIButton(type: .system)
        e.setBackgroundImage(UIImage(systemName: Constants.squareButton), for: .normal)
        e.translatesAutoresizingMaskIntoConstraints = false
        e.tintColor = .AIQNeutralGray()
        e.addTarget(self, action: #selector(radioButtonHandler), for: .touchUpInside)
        return e
    }()
    
    private let productLabel: UILabel = {
        let e = UILabel()
        e.font = .AIQItemtitle()
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
        e.isHidden = true
        return e
    }()
    
    weak var delegate: SoloButtonDelegate?
    
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
        guard let aditional = aditional else { return }
        
        productLabel.text = aditional.itemTitle ?? String()
        guard aditional.hasPromo == true else {
            if aditional.price ?? 0 > 0 {
                priceLabel.text = aditional.price?.toPlusCurrencyString()
            } else {
                priceLabel.text = ""
            }
            promoPriceLabel.isHidden = true
            return
        }
        priceLabel.text = aditional.promoPrice?.toPlusCurrencyString()
        promoPriceLabel.text = "de \(aditional.price?.toCurrenryString()) por"
        promoPriceLabel.isHidden = false
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(promoPriceLabel)
        contentView.addSubview(squareButton)
        
        NSLayoutConstraint.activate([
            squareButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            squareButton.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor),
            
            productLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            productLabel.leadingAnchor.constraint(equalTo: squareButton.trailingAnchor, constant: 8),
            productLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: squareButton.centerYAnchor),
            
            promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            promoPriceLabel.centerYAnchor.constraint(equalTo: squareButton.centerYAnchor)
        ])
        
    }
    
}

extension AditionalItemTableViewCell {
    
    @objc
    func radioButtonHandler(_ sender: UIButton) {
        guard let itemTitle = productLabel.text else { return }
        delegate?.soloButtonHandler(sender, itemTitle)
        
        toggleButton(sender)
        
    }
    
    func toggleButton(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(systemName: Constants.squareButton) {
            sender.tintColor = .AIQTeal()
            sender.setBackgroundImage(UIImage(systemName: Constants.selectedSquareButton), for: .normal)
            return
        }
        sender.tintColor = .AIQNeutralGray()
        sender.setBackgroundImage(UIImage(systemName: Constants.squareButton), for: .normal)
    }
    
}
