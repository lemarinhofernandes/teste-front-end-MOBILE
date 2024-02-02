//
//  itemInfoView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

final class itemInfoView: UIView {
    
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Ceviche de salmão"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let apartirDe: UILabel = {
        let label = UILabel()
        label.text = "a partir de R$19,90"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "salmão temperado com limão, cebola e pimenta"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "quantos?"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.tintColor = .white
        button.setTitle("Adicionar", for: .normal)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(paddingView)
        self.paddingView.addSubview(titleLabel)
        self.paddingView.addSubview(apartirDe)
        self.paddingView.addSubview(descriptionLabel)
        self.paddingView.addSubview(quantityButton)
        self.paddingView.addSubview(quantityLabel)
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            apartirDe.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            apartirDe.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            apartirDe.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: apartirDe.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            quantityButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+8),
            quantityButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            quantityButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            
            quantityLabel.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            
        ])
        
    }
}
