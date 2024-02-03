//
//  CategoryView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class Category2View: UIView {
    
    //MARK: - Properties
    private let padding: UIView = {
        let e = UIView()
        e.backgroundColor = .clear
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let titleLabel: UILabel = {
        let e = UILabel()
        e.text = "Vai querer bebida?"
        e.font = UIFont.systemFont(ofSize: 16)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let subtitleLabel: UILabel = {
        let e = UILabel()
        e.text = "escolha quantos quiser"
        e.font = UIFont.systemFont(ofSize: 12)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var optionsStackView: UIStackView = {
        let e = UIStackView()
        e.axis = .vertical
        e.alignment = .fill
        e.translatesAutoresizingMaskIntoConstraints = false
        e.spacing = 8
        e.distribution = .fill
        return e
    }()
    
    private let separator: UIView = {
        let e = UIView()
        e.backgroundColor = .systemGray4
        e.translatesAutoresizingMaskIntoConstraints = false
        e.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return e
    }()
    
    private let numstack = 4
    
    
    init(items: [DrinkModel]?) {
        super.init(frame: .zero)
        guard let items = items else { return }
        stackhelper(with: items)
        addComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stackhelper(with items: [DrinkModel]) {
        for item in items {
            guard let id = item.id, let title = item.title, let price = item.price else { return }
            optionsStackView.addArrangedSubview(CategoryRow(id: id, title: title, hasPromo: false, price: price, promoPrice: nil, category: .quantity, delegate: nil))
        }
    }
    
    func addComponents() {
        self.addSubview(padding)
        self.padding.addSubview(titleLabel)
        self.padding.addSubview(subtitleLabel)
        self.padding.addSubview(optionsStackView)
        self.padding.addSubview(separator)
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            padding.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            padding.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            padding.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            padding.bottomAnchor.constraint(equalTo: self.separator.topAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: padding.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            
            optionsStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            optionsStackView.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            optionsStackView.trailingAnchor.constraint(equalTo: padding.trailingAnchor),
            optionsStackView.bottomAnchor.constraint(equalTo: padding.bottomAnchor),
            
            separator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
}
