//
//  CustomCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class CustomCell: UITableViewCell {
    
    private struct Constants {
        static let circleButton = "circle"
        static let selectedCircleButton = "checkmark.circle.fill"
        static let squareButton = "square"
        static let selectedSquareButton = "checkmark.square.fill"
        static let minusButton = "minus.circle.fill"
        static let plusButton = "plus.circle"
    }
    
    static let identifier = "CustomCell"
    
    private let selectButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.squareButton), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let productLabel: UILabel = {
        let e = UILabel()
        let imageAttachment = NSTextAttachment(image: UIImage(named: "promo")!)
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        let attributedText = NSMutableAttributedString(attachment: imageAttachment)
        attributedText.append(NSAttributedString(string: "médio"))
        e.translatesAutoresizingMaskIntoConstraints = false
        e.attributedText = attributedText
        return e
    }()
    
    private let price: UILabel = {
        let e = UILabel()
        let attributedText = NSMutableAttributedString(string: "de R$22,90 por ")
        attributedText.append(NSAttributedString(string: "R$ 19,90"))
        e.translatesAutoresizingMaskIntoConstraints = false
        e.attributedText = attributedText
        return e
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.contentView.addSubview(selectButton)
        self.contentView.addSubview(productLabel)
        self.contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            selectButton.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            selectButton.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            
            productLabel.leadingAnchor.constraint(equalTo: self.selectButton.trailingAnchor, constant: 4),
            productLabel.centerYAnchor.constraint(equalTo: self.selectButton.centerYAnchor),
            
            price.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            price.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor)
        ])
        
    }
    
}
