//
//  ViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let e = UIScrollView()
        e.translatesAutoresizingMaskIntoConstraints = false
//        e.contentSize = CGSizeMake(scrollViewContentWidth, screenHeight * 1.3)
        e.backgroundColor = .systemGray4
        e.bounces = true
        return e
    }()
    
    private let header = HeaderView()
    private lazy var observationView = ObservationView()
    private lazy var footerView = FooterView()
    private lazy var categoryTeste = CategoryTeste()
    private lazy var categoryTeste2 = CategoryTeste()
    private lazy var categoryTeste3 = CategoryTeste()
    private lazy var categoryTeste4 = CategoryTeste()
    
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    let scrollViewContentWidth = UIScreen.main.bounds.width
    
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
        self.view.addSubview(scrollView)
        self.view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            scrollView.topAnchor.constraint(equalTo: header.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        [categoryTeste, categoryTeste2, categoryTeste3, categoryTeste4, observationView].forEach { scrollView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            categoryTeste.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            categoryTeste.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTeste.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTeste.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryTeste2.topAnchor.constraint(equalTo: categoryTeste.bottomAnchor),
            categoryTeste2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTeste2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTeste2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryTeste3.topAnchor.constraint(equalTo: categoryTeste2.bottomAnchor),
            categoryTeste3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTeste3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTeste3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryTeste4.topAnchor.constraint(equalTo: categoryTeste3.bottomAnchor),
            categoryTeste4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTeste4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTeste4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            observationView.topAnchor.constraint(equalTo: categoryTeste4.bottomAnchor),
            observationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            observationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            observationView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            observationView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
            
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
