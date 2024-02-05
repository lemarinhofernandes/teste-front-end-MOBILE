//
//  CommonDelegates.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit

protocol CellsDelegate: AnyObject {
    func addMultiple(_ item: ItemModel)
    func addToCart(_ item: ItemModel)
    func removeFromCart(_ item: ItemModel)
}

protocol QuantityButtonsDelegate: AnyObject {
    func minusButton(_ sender: UIButton, _ amountLabel: UILabel, _ title: String)
    func plusButton(_ sender: UIButton, _ amountLabel: UILabel, _ title: String, _ initialPrice: Double, _ totalLabel: UILabel)
}

protocol ItemInfoTableViewCellDelegate: AnyObject {
    func didTapPlusButton(_ total: UILabel, _ amount: UILabel, _ minusButton: UIButton)
}

protocol SoloButtonDelegate: AnyObject {
    func soloButtonHandler(_ sender: UIButton, _ title: String)
}
