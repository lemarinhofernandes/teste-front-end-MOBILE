//
//  RadioButton.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import Foundation
import UIKit

protocol RadioButtonDelegate {
    func selectButton()
}

class RadioButton: UIView {
    private lazy var onlyOneButton: UIButton = {
        let e = UIButton(type: .system)
        e.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
        e.setBackgroundImage(UIImage(named: "radio-unselected"), for: .selected)
        e.translatesAutoresizingMaskIntoConstraints = false
        e.addTarget(self, action: #selector(onlyOneHelper), for: .touchUpInside)
        return e
    }()
    
    private var delegate: RadioButtonDelegate?
    
    init(delegate: RadioButtonDelegate?) {
        super.init(frame: .zero)
        
        self.delegate = delegate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func onlyOneHelper(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: "radio-unselected") {
            sender.setBackgroundImage(UIImage(named: "radio-selected"), for: .normal)
            self.delegate?.selectButton()
        } else {
            sender.setBackgroundImage(UIImage(named: "radio-unselected"), for: .normal)
        }
    }
    
    func setupUI() {
        self.addSubview(onlyOneButton)
        
        NSLayoutConstraint.activate([
            onlyOneButton.topAnchor.constraint(equalTo: self.topAnchor),
            onlyOneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            onlyOneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            onlyOneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    
}
