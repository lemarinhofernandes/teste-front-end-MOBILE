//
//  ItemViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 01/02/24.
//

import UIKit

class ItemViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    private let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray3
        return v
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "itemImage")
        return iv
    }()
    
    private let itemInfo: UIView = itemInfoView()
    private let categoryView: UIView = CategoryView()
    private let drinkView: UIView = DrinkView()
    private let cutlery: UIView = CutleryView()
    private let aditionalView: UIView = AditionalView()
    private let observationView: UIView = ObservationView()
    private let footerView: UIView = FooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
                
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            
        ])
        
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(itemInfo)
        self.contentView.addSubview(categoryView)
        self.contentView.addSubview(drinkView)
        self.contentView.addSubview(cutlery)
        self.contentView.addSubview(aditionalView)
        self.contentView.addSubview(observationView)
        self.contentView.addSubview(footerView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 195),
            
            itemInfo.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            itemInfo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            itemInfo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            itemInfo.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            categoryView.topAnchor.constraint(equalTo: self.itemInfo.bottomAnchor, constant: 4),
            categoryView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            categoryView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            drinkView.topAnchor.constraint(equalTo: self.categoryView.bottomAnchor, constant: 4),
            drinkView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            drinkView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            drinkView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            cutlery.topAnchor.constraint(equalTo: self.drinkView.bottomAnchor, constant: 4),
            cutlery.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cutlery.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cutlery.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            aditionalView.topAnchor.constraint(equalTo: self.cutlery.bottomAnchor, constant: 4),
            aditionalView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            aditionalView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            aditionalView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            observationView.topAnchor.constraint(equalTo: self.cutlery.bottomAnchor, constant: 4),
            observationView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            observationView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            observationView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            footerView.topAnchor.constraint(equalTo: self.observationView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            footerView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
