//
//  ViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    private let header = HeaderView()
    private let tableView: UITableView = {
        let element = UITableView()
        element.backgroundColor = .white
        element.allowsSelection = true
        element.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private let images: [UIImage?] = [
        UIImage(named: "aiqbranding"),
        UIImage(named: "aiqbranding"),
        UIImage(named: "aiqbranding"),
        UIImage(named: "aiqbranding"),
        UIImage(named: "aiqbranding"),
    ]
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    
    
}

//MARK: - Constraints
extension ViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(header)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.widthAnchor.constraint(equalTo: view.widthAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("the table view could not dequeue a custom cell")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
