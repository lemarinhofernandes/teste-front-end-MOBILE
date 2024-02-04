//
//  Delegates.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

protocol CellsDelegate: AnyObject {
    func addToCart(_ item: ItemModel)
    func removeFromCart(_ item: ItemModel)
}

protocol QuantityButtonsDelegate: AnyObject {
    func minusButton(_ sender: UIButton, _ amountLabel: UILabel, _ title: String)
    func plusButton(_ sender: UIButton, _ amountLabel: UILabel, _ title: String)
}

protocol ItemInfoTableViewCellDelegate: AnyObject {
    func didTapPlusButton(_ sender: UILabel)
}

protocol RadioButtonDelegate: AnyObject {
    func radioButtonHandler(_ sender: UIButton, _ title: String)
}
