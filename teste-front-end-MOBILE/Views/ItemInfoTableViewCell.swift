//
//  ItemInfoTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

protocol ItemInfoTableViewCellDelegate: AnyObject {
    func didTapPlusButton(_ sender: UILabel)
}

class ItemInfoTableViewCell: UITableViewCell {
    
    static let identifier = "ItemInfoTableViewCell"
    
    private struct Constants {
        static let trashIcon = "trash"
        static let plusIcon = "plus.circle"
    }
    
    //MARK: - Views
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "mainimage")
        iv.heightAnchor.constraint(equalToConstant: 195).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let minimumPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "quantos?"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var quantityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.tintColor = .white
        button.setTitle("Adicionar", for: .normal)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        button.addTarget(self, action: #selector(callPlus), for: .touchUpInside)
        return button
    }()
    
    private lazy var trashButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.trashIcon), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        e.addTarget(self, action: #selector(callQuantity), for: .touchUpInside)
        return e
    }()
    
    private lazy var plusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.plusIcon), for: .normal)
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var actualQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator: UIView = {
        let e = UIView()
        e.backgroundColor = .systemGray4
        e.translatesAutoresizingMaskIntoConstraints = false
        e.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return e
    }()
    
    //MARK: - Properties
    weak var delegate: ItemInfoTableViewCellDelegate?
    
    //MARK: - Lifecycle
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
    
    public func configure(with model: ProductModel?) {
        guard let model = model else { return }
        titleLabel.text = model.productTitle ?? String()
        minimumPriceLabel.text = "a partir de R$\(model.minimumPrice.toString())"
        descriptionLabel.text = model.productDescription ?? String()
    }

    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(paddingView)
        self.contentView.addSubview(separator)
        self.paddingView.addSubview(productImageView)
        self.paddingView.addSubview(titleLabel)
        self.paddingView.addSubview(minimumPriceLabel)
        self.paddingView.addSubview(descriptionLabel)
        self.paddingView.addSubview(quantityButton)
        self.paddingView.addSubview(quantityLabel)
        
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            productImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            paddingView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: self.separator.topAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            minimumPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            minimumPriceLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            minimumPriceLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: minimumPriceLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            quantityButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+8),
            quantityButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            quantityButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            
            quantityLabel.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            
            separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
        ])
        
    }
}


extension ItemInfoTableViewCell {
    @objc
    func callPlus() {
        self.delegate?.didTapPlusButton(self.totalLabel)
        
        quantityButton.removeFromSuperview()
        [trashButton, plusButton, actualQuantityLabel, totalLabel].forEach { paddingView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+12),
            plusButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -16),
            
            actualQuantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -15),
            actualQuantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            trashButton.trailingAnchor.constraint(equalTo: actualQuantityLabel.leadingAnchor, constant: -15),
            trashButton.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            quantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            totalLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 6),
            totalLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
        ])
    }
    
    @objc
    func callQuantity() {
        [trashButton, plusButton, actualQuantityLabel, totalLabel].forEach { $0.removeFromSuperview() }
        paddingView.addSubview(quantityButton)
        
        NSLayoutConstraint.activate([
            quantityButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+8),
            quantityButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            quantityButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            quantityLabel.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
        ])
    }
}
