//
//  RowTeste.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class RowTeste: UIView {

    private struct Constants {
        static let circleButton = "circle"
        static let selectedCircleButton = "checkmark.circle.fill"
        static let squareButton = "square"
        static let selectedSquareButton = "checkmark.square.fill"
        static let minusButton = "minus.circle.fill"
        static let plusButton = "plus.circle"
    }
    
    static let identifier = "CustomCell"
    
    private let selectButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.squareButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
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
        let attributedText = NSMutableAttributedString(string: "de R$22,90 por ")
        attributedText.append(NSAttributedString(string: "R$ 19,90"))
        e.translatesAutoresizingMaskIntoConstraints = false
        e.attributedText = attributedText
        return e
    }()
    
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
            selectButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            
            productLabel.leadingAnchor.constraint(equalTo: self.selectButton.trailingAnchor, constant: 4),
            productLabel.centerYAnchor.constraint(equalTo: self.selectButton.centerYAnchor),
            
            price.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            price.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor)
        ])
        
    }
    
}
