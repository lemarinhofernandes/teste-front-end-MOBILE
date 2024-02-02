//
//  ViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
//    private let scrollView: UIScrollView = {
//        let e = UIScrollView()
//        e.translatesAutoresizingMaskIntoConstraints = false
//        e.contentSize = CGSizeMake(scrollViewContentWidth, scrollViewContentHeight)
//        
//        return e
//    }()
    
    private let header = HeaderView()
    private lazy var category = CategoryView(delegate: self, dataSource: self)
    private lazy var category2 = CategoryView(delegate: self, dataSource: self)
    private lazy var category3 = CategoryView(delegate: self, dataSource: self)
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    
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
        
        self.view.addSubview(header)
        self.view.addSubview(category)
        self.view.addSubview(category2)
//        self.view.addSubview(category3)
        
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.widthAnchor.constraint(equalTo: view.widthAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            category.topAnchor.constraint(equalTo: header.bottomAnchor),
            category.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            category.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            category.widthAnchor.constraint(equalTo: view.widthAnchor),
//            category.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            category2.topAnchor.constraint(equalTo: category.bottomAnchor),
            category2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            category2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            category2.widthAnchor.constraint(equalTo: view.widthAnchor),
//            category2.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            category2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            category3.topAnchor.constraint(equalTo: category2.bottomAnchor),
//            category3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            category3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            category3.widthAnchor.constraint(equalTo: view.widthAnchor),
//            category3.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
