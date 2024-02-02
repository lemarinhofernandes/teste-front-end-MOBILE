//
//  HeaderView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class HeaderView: UIView {

    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let brandingImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "aiqbranding")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pinImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "pin")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "profile")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let adressButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("entregando em", for: .normal)
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
        self.backgroundColor = .purple
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(paddingView)
//        self.paddingView.addSubview(brandingImageView)
//        self.paddingView.addSubview(profileImageView)
//        self.paddingView.addSubview(pinImageView)
//        self.paddingView.addSubview(adressButton)
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
//            brandingImageView.topAnchor.constraint(equalTo: paddingView.topAnchor),
//            brandingImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
//            brandingImageView.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
//            
//            pinImageView.leadingAnchor.constraint(equalTo: brandingImageView.trailingAnchor, constant: 24),
//            pinImageView.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
//            
//            adressButton.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor, constant: 9.5),
//            adressButton.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
//            
//            brandingImageView.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
//            brandingImageView.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
        ])
    }

}
