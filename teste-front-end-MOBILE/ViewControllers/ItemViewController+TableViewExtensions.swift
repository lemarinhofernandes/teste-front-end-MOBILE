//
//  ItemViewController+TableViewExtensions.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        
        switch sectionType {
        case .productInfo(let product):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemInfoTableViewCell.identifier, for: indexPath) as? ItemInfoTableViewCell else {
                fatalError()
            }
            cell.delegate = self
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
            cell.delegate = self
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
