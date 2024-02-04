//
//  HeaderTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    static let identifier = "HeaderTableViewCell"
    
    private let pinImageView: UIImageView = {
        let element  = UIImageView()
        let image = UIImage(named: "pin")
        element.image = image
        element.isUserInteractionEnabled = false
        element.translatesAutoresizingMaskIntoConstraints = false
        element.heightAnchor.constraint(equalToConstant: 24).isActive = true
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private let stackV: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 2
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let deliveringLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 0
        element.text = "entregando em"
        element.textColor = .white
        element.font = UIFont.systemFont(ofSize: 14)
        return element
    }()
    
    private let locationLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 0
        element.text = "Rua Mandaguari, 198"
        element.textColor = .white
        element.font = UIFont.systemFont(ofSize: 16)
        return element
    }()
    
    private let paddingView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private let brandingImageView: UIImageView = {
        let element  = UIImageView()
        let image = UIImage(named: "aiqbranding")
        element.image = image
        element.isUserInteractionEnabled = false
        element.translatesAutoresizingMaskIntoConstraints = false
        element.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return element
    }()
    
    private let profileImageView: UIImageView = {
        let element  = UIImageView()
        let image = UIImage(named: "profile")
        element.image = image
        element.isUserInteractionEnabled = false
        element.translatesAutoresizingMaskIntoConstraints = false
        element.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return element
    }()
    
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

    func addComponents() {
        self.contentView.addSubview(paddingView)
        [brandingImageView, pinImageView, stackV, profileImageView].forEach { paddingView.addSubview($0) }
        [deliveringLabel, locationLabel].forEach { stackV.addArrangedSubview($0) }
    }
    
    func setupUI() {
        self.backgroundColor = .purple
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            stackV.topAnchor.constraint(equalTo: paddingView.topAnchor),
            stackV.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor, constant: 10),
            stackV.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            pinImageView.centerYAnchor.constraint(equalTo: stackV.centerYAnchor),
            pinImageView.leadingAnchor.constraint(equalTo: brandingImageView.trailingAnchor, constant: 24),
            
            profileImageView.centerYAnchor.constraint(equalTo: stackV.centerYAnchor),
            brandingImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            
            profileImageView.centerYAnchor.constraint(equalTo: stackV.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor)
            
        ])
        
    }
    
}
