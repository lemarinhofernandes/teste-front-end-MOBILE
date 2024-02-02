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
        e.backgroundColor = .systemGray4
        e.bounces = true
        return e
    }()
    
    private let header = HeaderView()
    private lazy var observationView = ObservationView()
    private lazy var footerView = FooterView()
    private lazy var iteminfo = itemInfoView()
    private lazy var categoryTeste = CategoryTeste()
    private lazy var categoryTeste2 = CategoryTeste()
    private lazy var categoryTeste3 = CategoryTeste()
    private lazy var categoryTeste4 = CategoryTeste()
    
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
        
        [categoryTeste, categoryTeste2, categoryTeste3, categoryTeste4, observationView, footerView, iteminfo]
            .forEach { scrollView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            iteminfo.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            iteminfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iteminfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iteminfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryTeste.topAnchor.constraint(equalTo: iteminfo.bottomAnchor),
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
            
            footerView.topAnchor.constraint(equalTo: observationView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            footerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
    }
}
