//
//  SelectButton.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

protocol SelectButtonProtocol {
    
}

class SelectButton: UIView {
    struct Constants {
        static let circleButton = "circle"
        static let selectedCircleButton = "checkmark.circle.fill"
        static let squareButton = "square"
        static let selectedSquareButton = "checkmark.square.fill"
        static let minusButton = "minus.circle.fill"
        static let plusButton = "plus.circle"
    }
    
    private lazy var onlyOneButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.squareButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var multipleButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.squareButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var minusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.minusButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var plusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.plusButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var quantityLabel: UILabel = {
        let e = UILabel()
        e.text = "0"
        e.font = UIFont.systemFont(ofSize: 16)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    let mainView = UIView()
    
    
    init(category type: CategoryTypeEnum) {
        super.init(frame: .zero)
        
        setupCategory(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCategory(type: CategoryTypeEnum) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .onlyOne:
            setupOnlyOneButton()
        case .multiple:
            setupMultipleButton()
        case .quantity:
            setupQuantityView()
        }
    }
    
    func setupOnlyOneButton() {
        self.addSubview(onlyOneButton)
        
        NSLayoutConstraint.activate([
            onlyOneButton.topAnchor.constraint(equalTo: self.topAnchor),
            onlyOneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            onlyOneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            onlyOneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setupMultipleButton() {
        self.addSubview(multipleButton)
        
        NSLayoutConstraint.activate([
            multipleButton.topAnchor.constraint(equalTo: self.topAnchor),
            multipleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            multipleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            multipleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setupQuantityView() {
        self.addSubview(minusButton)
        self.addSubview(plusButton)
        self.addSubview(quantityLabel)
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: self.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            minusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            quantityLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 15),
            quantityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            plusButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 15),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
}
