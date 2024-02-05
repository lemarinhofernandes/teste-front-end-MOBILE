//
//  ObservationTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class ObservationTableViewCell: UITableViewCell {
    private struct Constants {
        static let yPadding = CGFloat(5)
        static let xPadidng = CGFloat(12)
    }

    static let identifier = "ObservationTableViewCell"
    
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.layer.borderColor = UIColor.AIQBorderGray().cgColor
        paddingView.layer.borderWidth = 1
        paddingView.layer.cornerRadius = 4
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let observationTextfield: UITextView = {
        let textfield = UITextView()
    private let observationTextfield: UITextView = {
        let textfield = UITextView()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.text = "alguma observação do item? • opcional\nex: tirar algum ingrediente, ponto do prato"
        textfield.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(clearTextField)))
        textfield.font = .AIQproductDescription()
        textfield.textColor = .AIQNeutralGray2()
        return textfield
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.bounds
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(paddingView)
        self.paddingView.addSubview(observationTextfield)
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -63),
            
            observationTextfield.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: Constants.yPadding),
            observationTextfield.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: Constants.xPadidng),
            observationTextfield.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -Constants.xPadidng),
            observationTextfield.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -Constants.yPadding),
            observationTextfield.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
}

extension ObservationTableViewCell {
    @objc
    func clearTextField() {
        observationTextfield.text = nil
        self.contentView.reloadInputViews()
    }
}
