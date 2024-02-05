//
//  AditionalTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class AditionalTableViewCell: UITableViewCell {
    
    static let identifier = "AditionalTableViewCell"

    private let itemsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.isScrollEnabled = false
        table.register(AditionalItemTableViewCell.self, forCellReuseIdentifier: AditionalItemTableViewCell.identifier)
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
        title.text = "mais alguma coisa?"
        title.textColor = .AIQSubtitleGray()
        title.font = UIFont.AIQProductSubtitle2()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "escolha até 2"
        label.textColor = .AIQNeutralGray2()
        label.font = UIFont.AIQProductSubtitle4()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator = Separator()
    
    private var aditionals: [ItemModel]? = []
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
    
    func configure(with aditionals: [ItemModel]?) {
        guard let aditionals = aditionals else { return }
        self.aditionals = aditionals
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

extension AditionalTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aditionals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AditionalItemTableViewCell.identifier, for: indexPath) as? AditionalItemTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(with: aditionals?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32+12
    }
    
}

extension AditionalTableViewCell: SoloButtonDelegate {
    func soloButtonHandler(_ sender: UIButton, _ title: String) {
        guard let itemCart = self.aditionals?.first(where: { $0.itemTitle == title }) else { return }
        delegate?.addMultiple(itemCart)
    }
    
}
