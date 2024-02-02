//
//  CategoryView.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import UIKit

class CategoryView: UIView {
    //MARK: - Properties
    private let padding: UIView = {
        let e = UIView()
        e.backgroundColor = .clear
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let titleLabel: UILabel = {
        let e = UILabel()
        e.text = "qual o tamanho?"
        e.font = UIFont.systemFont(ofSize: 16)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let subtitleLabel: UILabel = {
        let e = UILabel()
        e.text = "escolha 1"
        e.font = UIFont.systemFont(ofSize: 12)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let isMandatoryLabel: UILabel = {
        let e = UILabel()
        e.text = "obrigatorio"
        e.font = UIFont.systemFont(ofSize: 12)
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    private let tableView: UITableView = {
        let element = UITableView()
        element.backgroundColor = .white
        element.allowsSelection = true
        element.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        element.separatorStyle = .none
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    //MARK: - Lifecycle
    required init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        addComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addComponents() {
        self.addSubview(padding)
        self.padding.addSubview(titleLabel)
        self.padding.addSubview(subtitleLabel)
        self.padding.addSubview(isMandatoryLabel)
        self.padding.addSubview(tableView)
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            padding.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            padding.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            padding.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            padding.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: padding.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            
            isMandatoryLabel.trailingAnchor.constraint(equalTo: padding.trailingAnchor),
            isMandatoryLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: padding.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: padding.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: padding.bottomAnchor),
        ])
    }
    
}
