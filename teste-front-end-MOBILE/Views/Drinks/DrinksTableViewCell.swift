//
//  DrinksTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class DrinksTableViewCell: UITableViewCell {
    
    private struct Constants {
        static let minusButton = "minusButton"
        static let disabledMinusButton = "disabledMinusButton"
    }
    
    static let identifier = "DrinksTableViewCell"
    
    private let itemsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.isScrollEnabled = false
        table.register(DrinkItemTableViewCell.self, forCellReuseIdentifier: DrinkItemTableViewCell.identifier)
        table.allowsSelectionDuringEditing = false
        return table
    }()
    
    private let paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .clear
        return paddingView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "vai querer bebida?"
        title.textColor = .AIQSubtitleGray()
        title.font = .AIQProductSubtitle2()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "escolha quantos quiser"
        label.textColor = .AIQNeutralGray2()
        label.font = UIFont.AIQProductSubtitle4()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator = Separator()
    
    private var drinks: [ItemModel]? = []
    private var amount: Int = 0
    weak var delegate: CellsDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.bounds
    }
    
    func configure(with drinks: [ItemModel]?) {
        guard let drinks = drinks else { return }
        self.drinks = drinks
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(paddingView)
        self.contentView.addSubview(separator)
        self.paddingView.addSubview(titleLabel)
        self.paddingView.addSubview(subtitle)
        self.paddingView.addSubview(itemsTableView)
        
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            paddingView.bottomAnchor.constraint(equalTo: self.separator.topAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: paddingView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            subtitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitle.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            
            itemsTableView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 16),
            itemsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsTableView.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor),
            
            separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
        ])
        
    }
}

extension DrinksTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkItemTableViewCell.identifier, for: indexPath) as? DrinkItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.configure(with: self.drinks?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32+12
    }
    
}

extension DrinksTableViewCell: QuantityButtonsDelegate {
    
    func minusButton(_ sender: UIButton, _ actualAmount: UILabel, _ title: String) {
        if self.amount > 0 {
            self.amount -= 1
        }
        
        if self.amount == 0 {
            sender.setBackgroundImage(UIImage(named: Constants.disabledMinusButton), for: .normal)
            sender.setImage(nil, for: .normal)
        }
        actualAmount.text = String(describing: self.amount)
        
    }
    
    func plusButton(_ sender: UIButton, _ amountLabel: UILabel, _ title: String, _ initialPrice: Double, _ totalLabel: UILabel) {
        guard let itemCart = self.drinks?.first(where: { $0.itemTitle == title }) else { return }
        self.delegate?.addMultiple(itemCart)
        
        self.amount += 1
        sender.setBackgroundImage(nil, for: .normal)
        sender.setImage(UIImage(named: Constants.minusButton), for: .normal)
        sender.heightAnchor.constraint(equalToConstant: 32).isActive = true
        sender.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        totalLabel.text = getTotal(for: initialPrice, with: self.amount)
        amountLabel.text = String(describing: self.amount)
    }
    
    func getTotal(for price: Double, with amount: Int) -> String {
        let total = price * Double(amount)
        return total.toPlusCurrencyString()
    }
    
}
