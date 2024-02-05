//
//  ItemViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

enum SectionType {
    case productInfo(product: ProductModel?)
    case productSize(sizes: [ItemModel]?)
    case productDrinks(drinks: [ItemModel]?)
    case productCutlery(cutleries: [ItemModel]?)
    case productAditional(aditionals: [ItemModel]?)
    case productObservation
    case footer
}

class ItemViewController: UIViewController {
    
    //MARK: - Views
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelectionDuringEditing = false
        table.register(ItemInfoTableViewCell.self, forCellReuseIdentifier: ItemInfoTableViewCell.identifier)
        table.register(SizeTableViewCell.self, forCellReuseIdentifier: SizeTableViewCell.identifier)
        table.register(DrinksTableViewCell.self, forCellReuseIdentifier: DrinksTableViewCell.identifier)
        table.register(CutleryTableViewCell.self, forCellReuseIdentifier: CutleryTableViewCell.identifier)
        table.register(AditionalTableViewCell.self, forCellReuseIdentifier: AditionalTableViewCell.identifier)
        table.register(ObservationTableViewCell.self, forCellReuseIdentifier: ObservationTableViewCell.identifier)
        table.register(FooterTableViewCell.self, forCellReuseIdentifier: FooterTableViewCell.identifier)
        return table
    }()
    
    private let headerView = HeaderView()
    
    //MARK: - Properties
    private(set) var sections = [SectionType]()
    private var viewModel = ItemViewModel()
    private(set) var isTicketButtonEnabled: Bool = false
    private var productInfo: ProductModel? {
        didSet {
            configureSections()
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func configureSections() {
        guard let productInfo = self.productInfo else { return }
        sections.append(.productInfo(product: productInfo))
        sections.append(.productSize(sizes: productInfo.sizes))
        sections.append(.productDrinks(drinks: productInfo.drinks))
        sections.append(.productCutlery(cutleries: productInfo.cutleries))
        sections.append(.productAditional(aditionals: productInfo.aditional))
        sections.append(.productObservation)
        sections.append(.footer)
        
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.view.backgroundColor = .AIQBackground()
        view.addSubview(tableView)
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
}

//MARK: - Delegates

extension ItemViewController: ItemViewModelDelegate {
    func setTicketButton() {
        self.isTicketButtonEnabled = true
    }
    
    func updateProduct(product: ProductModel) {
        DispatchQueue.main.async {
            self.productInfo = product
            self.tableView.reloadData()
        }
    }
    
    func updateTotalValue(totalPrice: Double) {
        self.tableView.reloadData()
    }
}

extension ItemViewController: ItemInfoTableViewCellDelegate {
    func didTapPlusButton(_ total: UILabel, _ amount: UILabel) {
        DispatchQueue.main.async {
            self.viewModel.addProduct()
            total.text = "R$\(String(describing: self.viewModel.totalPrice))"
            amount.text = String(describing: self.viewModel.amount)
            self.tableView.reloadData()
        }
    }
    
}

extension ItemViewController: CellsDelegate {
    func removeFromCart(_ item: ItemModel) {
        viewModel.removeFromCart(for: item)
        print("removeu \(item)")
    }
    
    func addToCart(_ item: ItemModel) {
        viewModel.addToCart(for: item)
        print("adicionou \(item)")
    }
    
}
