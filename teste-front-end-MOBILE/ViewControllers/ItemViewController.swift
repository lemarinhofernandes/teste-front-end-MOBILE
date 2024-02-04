//
//  ItemViewController.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

enum SectionType {
    case header
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
        table.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        table.register(ItemInfoTableViewCell.self, forCellReuseIdentifier: ItemInfoTableViewCell.identifier)
        table.register(SizeTableViewCell.self, forCellReuseIdentifier: SizeTableViewCell.identifier)
        table.register(DrinksTableViewCell.self, forCellReuseIdentifier: DrinksTableViewCell.identifier)
        table.register(CutleryTableViewCell.self, forCellReuseIdentifier: CutleryTableViewCell.identifier)
        table.register(AditionalTableViewCell.self, forCellReuseIdentifier: AditionalTableViewCell.identifier)
        table.register(ObservationTableViewCell.self, forCellReuseIdentifier: ObservationTableViewCell.identifier)
        table.register(FooterTableViewCell.self, forCellReuseIdentifier: FooterTableViewCell.identifier)
        return table
    }()
    
    //MARK: - Properties
    private(set) var sections = [SectionType]()
    private var viewModel = ItemViewModel()
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
        tableView.frame = view.bounds
    }
    
    func configureSections() {
        guard let productInfo = self.productInfo else { return }
        sections.append(.header)
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
        self.view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
}

//MARK: - Delegates
extension ItemViewController: ItemViewModelDelegate {
    func updateProduct(product: ProductModel) {
        DispatchQueue.main.async {
            self.productInfo = product
            self.tableView.reloadData()
        }
    }
    
    func updateTotalValue(totalPrice: Double) {
        DispatchQueue.main.async {
            //
        }
    }
}

extension ItemViewController: ItemInfoTableViewCellDelegate {
    func didTapPlusButton(_ sender: UILabel) {
        sender.text = "total R$\(String(describing: viewModel.totalPrice))"
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
