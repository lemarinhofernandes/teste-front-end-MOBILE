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
        let imageAttachment = NSTextAttachment(image: UIImage(named: "promo")!)
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        let attributedText = NSMutableAttributedString(attachment: imageAttachment)
        attributedText.append(NSAttributedString(string: "médio"))
        e.translatesAutoresizingMaskIntoConstraints = false
        e.attributedText = attributedText
        return e
    }()
    
    private let price: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.text = "de 29,90 por 19,90"
        e.font = UIFont.systemFont(ofSize: 12)
        return e
    }()
    
    private lazy var selectButton = SelectButton(category: .quantity)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(selectButton)
        self.addSubview(productLabel)
        self.addSubview(price)
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            selectButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            selectButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -10),
            
            productLabel.leadingAnchor.constraint(equalTo: self.selectButton.trailingAnchor, constant: 4),
            productLabel.centerYAnchor.constraint(equalTo: self.selectButton.centerYAnchor),
            
            price.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 10),
            price.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor)
        ])
        
    }
    
}
