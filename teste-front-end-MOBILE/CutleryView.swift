//
//  CutleryView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class CutleryView: UIView {
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "precisa de talher?"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "escolha até 1"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mandatoryLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 78, height: 28)
        label.backgroundColor = .black
        label.text = "obrigatório"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.paddingView.addSubview(descriptionLabel)
        self.paddingView.addSubview(mandatoryLabel)
        mandatoryLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            mandatoryLabel.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 16-6),
            mandatoryLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
        ])
    }
    
}
