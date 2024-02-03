//
//  FooterView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class FooterView: UIView {

    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let madeWithLoveLabel: UILabel = {
        let label = UILabel()
        label.text = "feito com 💜 em maringá-PR"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.text = "aiqfome.com © 2007-2023 aiqfome LTDA . CNPJ: 09.186.786/0001-58"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let ticketButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.tintColor = .white
        button.setTitle("ver ticket", for: .normal)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(paddingView)
        self.paddingView.addSubview(madeWithLoveLabel)
        self.paddingView.addSubview(adressLabel)
        self.paddingView.addSubview(ticketButton)
        
        adressLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            madeWithLoveLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            madeWithLoveLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            madeWithLoveLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            adressLabel.topAnchor.constraint(equalTo: madeWithLoveLabel.bottomAnchor, constant: 8),
            adressLabel.leadingAnchor.constraint(equalTo: madeWithLoveLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: madeWithLoveLabel.trailingAnchor),
            adressLabel.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            ticketButton.topAnchor.constraint(equalTo: madeWithLoveLabel.bottomAnchor, constant: 16),
            ticketButton.leadingAnchor.constraint(equalTo: madeWithLoveLabel.leadingAnchor),
            ticketButton.trailingAnchor.constraint(equalTo: madeWithLoveLabel.trailingAnchor),
            ticketButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: 8),    
            ticketButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}
