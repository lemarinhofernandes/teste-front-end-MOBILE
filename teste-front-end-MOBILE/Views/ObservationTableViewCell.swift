//
//  ObservationTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class ObservationTableViewCell: UITableViewCell {

    static let identifier = "ObservationTableViewCell"
    
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let observationTextfield: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "alguma observação do item? • opcional\nex: tirar algum ingrediente, ponto do prato"
        textfield.font = UIFont.systemFont(ofSize: 12)
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
            
            observationTextfield.topAnchor.constraint(equalTo: paddingView.topAnchor),
            observationTextfield.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            observationTextfield.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            observationTextfield.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            observationTextfield.widthAnchor.constraint(equalTo: paddingView.widthAnchor),
            observationTextfield.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
}
