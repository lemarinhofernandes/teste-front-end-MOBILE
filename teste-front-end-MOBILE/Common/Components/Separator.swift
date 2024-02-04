//
//  Separator.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

final class Separator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .AIQBackground()
        self.heightAnchor.constraint(equalToConstant: 4).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
