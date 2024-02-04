//
//  CutleryTableViewCell.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

class CutleryTableViewCell: UITableViewCell {

    static let identifier = "CutleryTableViewCell"
    
    private let itemsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.isScrollEnabled = false
        table.register(CutleryItemTableViewCell.self, forCellReuseIdentifier: CutleryItemTableViewCell.identifier)
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
        title.text = "precisa de talher?"
        title.textColor = .AIQSubtitleGray()
        title.font = UIFont.AIQProductSubtitle2()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "escolha até 1"
        label.textColor = .AIQNeutralGray2()
        label.font = UIFont.AIQProductSubtitle4()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator = Separator()
    
    weak var delegate: CellsDelegate?
    private var cutleries: [ItemModel]? = []
    private var cellTitle: String? {
        didSet {
            itemsTableView.reloadData()
        }
    }
    
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
    
    func configure(with cutleries: [ItemModel]?) {
        guard let cutleries = cutleries else { return }
        self.cutleries = cutleries
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

extension CutleryTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cutleries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CutleryItemTableViewCell.identifier, for: indexPath) as? CutleryItemTableViewCell else {
            return UITableViewCell()
        }
        
        let title = self.cutleries?[indexPath.row].itemTitle
        
        if title != cellTitle {
            cell.untoggle()
        }
        
        if title == cellTitle {
            cell.toggle()
        }
        
        cell.delegate = self
        cell.configure(with: self.cutleries?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32+12
    }
    
}

extension CutleryTableViewCell: RadioButtonDelegate {
    func radioButtonHandler(_ sender: UIButton, _ title: String) {
        self.cellTitle = title
        guard let itemCart = self.cutleries?.first(where: { $0.itemTitle == title }) else { return }
        delegate?.addToCart(itemCart)
    }
}
