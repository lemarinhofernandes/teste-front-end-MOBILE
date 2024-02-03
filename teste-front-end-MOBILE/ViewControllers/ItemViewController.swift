//
//  ItemViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class ItemViewController: UIViewController {
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
    private lazy var iteminfo = ItemInfoView()
    private lazy var categorySize = CategoryView(items: viewModel.product.sizes, delegate: self)
    private lazy var categoryDrink = Category2View(items: viewModel.product.drinks)
    private lazy var categoryCutlery = Category3View(items: viewModel.product.cutlery)
    private lazy var categoryAditional = Category4View(items: viewModel.product.aditional)
    
    private let viewModel = ItemViewModel(for: "2")
    
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

// MARK: - Delegates
extension ItemViewController: CategoryViewDelegate {
    func addToBasket(id: Int) {
        self.viewModel.addToBasket(for: id)
        footerView.setTicketButtonAvailable()
    }
    
    func removeFromBasket(id: Int) {
        self.viewModel.removeFromBasket(for: id)
    }
    
}

//MARK: - Constraints
extension ItemViewController {
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
        
        [categorySize, categoryDrink, categoryCutlery, categoryAditional, observationView, footerView, iteminfo]
            .forEach { scrollView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            iteminfo.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            iteminfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iteminfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iteminfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categorySize.topAnchor.constraint(equalTo: iteminfo.bottomAnchor),
            categorySize.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categorySize.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categorySize.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryDrink.topAnchor.constraint(equalTo: categorySize.bottomAnchor),
            categoryDrink.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryDrink.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryDrink.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryCutlery.topAnchor.constraint(equalTo: categoryDrink.bottomAnchor),
            categoryCutlery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCutlery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCutlery.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            categoryAditional.topAnchor.constraint(equalTo: categoryCutlery.bottomAnchor),
            categoryAditional.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryAditional.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryAditional.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            observationView.topAnchor.constraint(equalTo: categoryAditional.bottomAnchor),
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
