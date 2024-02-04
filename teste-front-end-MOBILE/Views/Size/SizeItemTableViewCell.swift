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
    
    private var promoView: PromoView = PromoView(hasPromo: false, label: "")
    
    private weak var delegate: RadioButtonDelegate?
    
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
    
    public func configure(with size: ItemModel?, delegate: RadioButtonDelegate?) {
        guard let size = size else { return }
        
        self.promoView.configure(hasPromo: size.hasPromo ?? false, label: size.itemTitle ?? String())
        self.delegate = delegate
        
        guard size.hasPromo == true else {
            priceLabel.text = "R$\(size.price.toString())"
            promoPriceLabel.isHidden = true
            return
        }
        
        priceLabel.text = "R$\(size.promoPrice.toString())"
        promoPriceLabel.text = "de R$\(size.price.toString()) por"
        promoPriceLabel.isHidden = false
        
    }
    
    func addComponents() {
        contentView.addSubview(priceLabel)
        contentView.addSubview(promoPriceLabel)
        contentView.addSubview(radioButton)
        contentView.addSubview(promoView)
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radioButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            radioButton.centerYAnchor.constraint(equalTo: promoView.centerYAnchor, constant: 1),
            
            promoView.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: 5),
            
            promoView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            promoView.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: 8),
            promoView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor),
            
            promoPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            promoPriceLabel.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor)
        ])
        
    }
    
}

extension SizeItemTableViewCell {
    func toggle() {
        radioButton.setBackgroundImage(UIImage(named: "radio-selected"), for: .normal)
    }
    
    func untoggle() {
        radioButton.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
    }
    
    @objc
    func radioButtonHandler(_ sender: UIButton) {
        guard let productLabel = promoView.productLabel.text else { return }
        self.delegate?.radioButtonHandler(sender, productLabel)
    }
    
}
