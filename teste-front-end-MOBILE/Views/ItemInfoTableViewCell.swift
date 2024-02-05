//
//  ItemInfoTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

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
        iv.image = UIImage(systemName: "wifi.exclamationmark.circle.fill")
        iv.heightAnchor.constraint(equalToConstant: 195).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.AIQProductTitle()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let minimumPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .AIQNeutralGray2()
        label.text = "a partir de "
        label.font = UIFont.AIQproductMinimumLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minimumPriceValue: UILabel = {
        let label = UILabel()
        label.textColor = .AIQMainPurple()
        label.font = UIFont.AIQproductMinimumPrice()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .AIQNeutralGray2()
        label.font = UIFont.AIQproductDescription()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "quantos?"
        label.textColor = .AIQDarkGray()
        label.font = UIFont.AIQProductSubtitle2()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var quantityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .AIQNeutralGray2()
        button.tintColor = .white
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.font = UIFont.AIQProductSubtitle3()
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        button.addTarget(self, action: #selector(setPlusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var trashButton: UIButton = {
        let e = UIButton(type: .system)
        let image = UIImage(named: Constants.trashIcon)
        e.setImage(image, for: .normal)
        e.contentMode = .scaleAspectFit
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        e.heightAnchor.constraint(equalToConstant: 24).isActive = true
        e.widthAnchor.constraint(equalToConstant: 24).isActive = true
        e.tintColor = .AIQTeal()
        e.addTarget(self, action: #selector(callQuantity), for: .touchUpInside)
        return e
    }()
    
    private lazy var plusButton: UIButton = {
        let e = UIButton(type: .system)
        e.setImage(UIImage(systemName: Constants.plusIcon), for: .normal)
        e.tintColor = .AIQTeal()
        e.heightAnchor.constraint(equalToConstant: 36).isActive = true
        e.widthAnchor.constraint(equalToConstant: 36).isActive = true
        e.isEnabled = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private lazy var actualQuantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .AIQProductSubtitle2()
        label.textColor = .AIQDarkGray()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .AIQNeutralGray2()
        label.text = "total "
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .AIQDarkGray()
        label.font = UIFont.AIQProductSubtitle3()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator = Separator()
    
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
        
        minimumPriceValue.text = "R$\(model.minimumPrice.toString())"
        
        descriptionLabel.text = model.productDescription ?? String()
        productImageView.image = model.productImage
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
        self.paddingView.addSubview(minimumPriceValue)
        
        
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
            
            
            minimumPriceLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            minimumPriceLabel.centerYAnchor.constraint(equalTo: minimumPriceValue.centerYAnchor),
            
            minimumPriceValue.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            minimumPriceValue.leadingAnchor.constraint(equalTo: minimumPriceLabel.trailingAnchor),
            
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
    func setPlusButton() {
        self.delegate?.didTapPlusButton(self.totalValueLabel, self.actualQuantityLabel)
        
        quantityButton.removeFromSuperview()
        [trashButton, plusButton, actualQuantityLabel, totalTextLabel, totalValueLabel].forEach { paddingView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+12),
            plusButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            
            actualQuantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -15),
            actualQuantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            trashButton.trailingAnchor.constraint(equalTo: actualQuantityLabel.leadingAnchor, constant: -15),
            trashButton.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            quantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            
            totalTextLabel.centerYAnchor.constraint(equalTo: totalValueLabel.centerYAnchor),
            totalTextLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            
            totalValueLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 4),
            totalValueLabel.leadingAnchor.constraint(equalTo: totalTextLabel.trailingAnchor),
            totalValueLabel.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
        ])
    }
    
    @objc
    func callQuantity() {
        [trashButton, plusButton, actualQuantityLabel, totalTextLabel, totalValueLabel].forEach { $0.removeFromSuperview() }
        paddingView.addSubview(quantityButton)
        
        NSLayoutConstraint.activate([
            quantityButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16+8),
            quantityButton.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            quantityButton.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            quantityLabel.centerYAnchor.constraint(equalTo: quantityButton.centerYAnchor),
        ])
    }
}
