//
//  SizeTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class SizeTableViewCell: UITableViewCell {
    
    static let identifier = "SizeTableViewCell"
    
    private let itemsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.isScrollEnabled = false
        table.register(SizeItemTableViewCell.self, forCellReuseIdentifier: SizeItemTableViewCell.identifier)
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
        title.text = "qual o tamanho?"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "escolha 1"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mandatoryLabel: UILabel = {
        let label = UILabel()
        label.text = "obrigatorio"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
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
    
    private var sizes: [ItemModel]? = []
    
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
    
    public func configure(with sizes: [ItemModel]?) {
        self.sizes = sizes
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(paddingView)
        self.contentView.addSubview(separator)
        self.paddingView.addSubview(titleLabel)
        self.paddingView.addSubview(subtitle)
        self.paddingView.addSubview(mandatoryLabel)
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
            
            mandatoryLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            mandatoryLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
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

extension SizeTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sizes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SizeItemTableViewCell.identifier, for: indexPath) as? SizeItemTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self.sizes?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32+12
    }
    
}
