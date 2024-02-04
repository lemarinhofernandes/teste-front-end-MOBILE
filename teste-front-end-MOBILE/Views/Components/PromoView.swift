//
//  PromoView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

final class PromoView: UIView {
    
    lazy var productLabel: UILabel = {
        let e = UILabel()
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var promoIconImageView: UIImageView = {
        let e = UIImageView()
        let image = UIImage(named: "promo")
        e.image = image
        e.isUserInteractionEnabled = false
        e.contentMode = .scaleAspectFit
        e.heightAnchor.constraint(equalToConstant: 22).isActive = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    init(hasPromo: Bool, label: String) {
        super.init(frame: .zero)
        
        self.productLabel.text = label
        setupUI(hasPromo: hasPromo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(hasPromo: Bool, label: String) {
        self.productLabel.text = label
        removeUI()
        setupUI(hasPromo: hasPromo)
    }
    
    func removeUI() {
        [productLabel, promoIconImageView].forEach { $0.removeFromSuperview() }
    }
    
    func setupUI(hasPromo: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if !hasPromo {
            self.addSubview(productLabel)
            
            NSLayoutConstraint.activate([
                productLabel.topAnchor.constraint(equalTo: self.topAnchor),
                productLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                productLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
            return
        }
        
        self.addSubview(productLabel)
        self.addSubview(promoIconImageView)
        
        NSLayoutConstraint.activate([
            promoIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promoIconImageView.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor, constant: 1),
            
            productLabel.leadingAnchor.constraint(equalTo: promoIconImageView.trailingAnchor, constant: 2),
            productLabel.topAnchor.constraint(equalTo: self.topAnchor),
            productLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
}
