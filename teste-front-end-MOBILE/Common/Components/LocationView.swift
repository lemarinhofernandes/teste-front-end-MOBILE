//
//  LocationView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

class LocationView: UIView {
    
    private let locationLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 0
        element.text = "Rua Mandaguari, 198"
        element.textColor = .white
        element.isUserInteractionEnabled = true
        element.font = UIFont.AIQProductSubtitle2()
        return element
    }()
    
    lazy var locationArrow: UIImageView = {
        let e = UIImageView()
        e.image = UIImage(named: "arrows")
        e.contentMode = .scaleAspectFit
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLocationViewTap))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationLabel)
        self.addSubview(locationArrow)
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: self.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            locationArrow.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            locationArrow.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 4),
            locationArrow.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
        ])
    }
    
    @objc 
    func handleLocationViewTap() {
        #if DEBUG
            print("trocar localizacao do usuario")
        #endif
    }
}

