//
//  HeaderView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class HeaderView: UIView {
    //MARK: - Properties
    private let stackH: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let pinImageView: UIImageView = {
        let element  = UIImageView()
        let image = UIImage(named: "pin")
        element.image = image
        element.isUserInteractionEnabled = false
        element.translatesAutoresizingMaskIntoConstraints = false
        element.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addComponents() {
        self.addSubview(paddingView)
        [brandingImageView, stackH, profileImageView].forEach { paddingView.addSubview($0) }
        [pinImageView, stackV].forEach { stackH.addArrangedSubview($0) }
        [deliveringLabel, locationLabel].forEach { stackV.addArrangedSubview($0) }
    }
    
    func setupUI() {
        self.backgroundColor = .purple
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            stackH.topAnchor.constraint(equalTo: paddingView.topAnchor),
            stackH.leadingAnchor.constraint(equalTo: brandingImageView.trailingAnchor, constant: 24),
            stackH.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            profileImageView.centerYAnchor.constraint(equalTo: stackH.centerYAnchor),
            brandingImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            
            profileImageView.centerYAnchor.constraint(equalTo: stackH.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor)
            
        ])
        
    }
}
