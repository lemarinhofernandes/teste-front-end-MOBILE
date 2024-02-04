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
    private var sections = [SectionType]()
    private var viewModel = ItemViewModel()
    private var productInfo: ProductModel? {
        didSet {
            self.tableView.reloadData()
            configureSections()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureSections()
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
        tableView.reloadData()
        self.view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
}

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

//MARK: - TableView
extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
        case .productInfo(let product):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemInfoTableViewCell.identifier, for: indexPath) as? ItemInfoTableViewCell else {
                fatalError()
            }
            cell.configure(with: product)
            cell.selectionStyle = .none
            return cell
            
        case .productSize(let sizes):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SizeTableViewCell.identifier, for: indexPath) as? SizeTableViewCell else {
                fatalError()
            }
            cell.configure(with: sizes)
            cell.selectionStyle = .none
            return cell
            
        case .productDrinks(let drinks):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinksTableViewCell.identifier, for: indexPath) as? DrinksTableViewCell else {
                fatalError()
            }
            cell.configure(with: drinks)
            cell.selectionStyle = .none
            return cell
            
        case .productCutlery(let cutleries):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CutleryTableViewCell.identifier, for: indexPath) as? CutleryTableViewCell else {
                fatalError()
            }
            cell.configure(with: cutleries)
            cell.selectionStyle = .none
            return cell
            
        case .productAditional(let aditionals):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AditionalTableViewCell.identifier, for: indexPath) as? AditionalTableViewCell else {
                fatalError()
            }
            cell.configure(with: aditionals)
            cell.selectionStyle = .none
            return cell
            
        case .productObservation:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ObservationTableViewCell.identifier, for: indexPath) as? ObservationTableViewCell else {
                fatalError()
            }
            cell.selectionStyle = .none
            return cell
            
        case .footer:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FooterTableViewCell.identifier, for: indexPath) as? FooterTableViewCell else {
                fatalError()
            }
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
        case .header:
            return UITableView.automaticDimension
        case .productInfo:
            return UITableView.automaticDimension
        case .productSize(let sizes):
            return getHeight(for: sizes?.count)
        case .productDrinks(let drinks):
            return getHeight(for: drinks?.count)
        case .productCutlery(let cutleries):
            return getHeight(for: cutleries?.count)
        case .productAditional(let aditionals):
            return getHeight(for: aditionals?.count)
        case .productObservation:
            return UITableView.automaticDimension
        case .footer:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension ItemViewController {
    func getHeight(for count: Int?) -> CGFloat {
        let cellValue = 32+12
        let categoryInitial = 90
        let result = (cellValue * (count ?? 1)) + categoryInitial
        return CGFloat(result)
    }
}

