//
//  FooterTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    
    static let identifier = "FooterTableViewCell"

    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let madeWithLoveLabel: UILabel = {
        let label = UILabel()
        label.text = "feito com 💜 em maringá-PR"
        label.font = .AIQProductSubtitle3()
        label.textColor = .AIQFooterPurple()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.text = "aiqfome.com © 2007-2023 aiqfome LTDA . CNPJ: 09.186.786/0001-58"
        label.font = .AIQProductSubtitle2()
        label.textColor = .AIQFooterPurple()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let ticketButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .AIQMainPurple()
        button.tintColor = .white
        button.setTitle("ver ticket", for: .normal)
        button.titleLabel?.font = .AIQProductSubtitle2()
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapTicketButton), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        return button
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
        contentView.backgroundColor = .AIQBackground()
        contentView.frame = contentView.bounds
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(paddingView)
        self.paddingView.addSubview(madeWithLoveLabel)
        self.paddingView.addSubview(adressLabel)
        self.paddingView.addSubview(ticketButton)
        
        adressLabel.isHidden = true
        ticketButton.isHidden = false
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            madeWithLoveLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            madeWithLoveLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            madeWithLoveLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            adressLabel.topAnchor.constraint(equalTo: madeWithLoveLabel.bottomAnchor, constant: 8),
            adressLabel.leadingAnchor.constraint(equalTo: madeWithLoveLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: madeWithLoveLabel.trailingAnchor),
            adressLabel.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            ticketButton.topAnchor.constraint(equalTo: madeWithLoveLabel.bottomAnchor, constant: 16),
            ticketButton.leadingAnchor.constraint(equalTo: madeWithLoveLabel.leadingAnchor),
            ticketButton.trailingAnchor.constraint(equalTo: madeWithLoveLabel.trailingAnchor),
            ticketButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: 8),
            ticketButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}

extension FooterTableViewCell {
    @objc
    func didTapTicketButton() {
        #if DEBUG
        print("mostrar ticket ao usuario")
        #endif
    }
    
    func setTicketButtonAvailable() {
        adressLabel.isHidden = true
        ticketButton.isHidden = false
    }
    
    func setTicketButtonUnavailable() {
        adressLabel.isHidden = false
        ticketButton.isHidden = true
    }
}
