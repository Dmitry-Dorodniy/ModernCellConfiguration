//
//  CustomTableViewCell.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 25.08.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        var contentConfig = defaultContentConfiguration().updated(for: state)
        
        contentConfig.text = "Hello World"
        contentConfig.image = UIImage(systemName: "bell")
        
        var backgroudConfig = defaultBackgroundConfiguration().updated(for: state)
        backgroudConfig.backgroundColor = .clear
        
        if state.isHighlighted || state.isSelected {
            backgroudConfig.backgroundColor = .systemMint
            contentConfig.textProperties.color = .white
            contentConfig.imageProperties.tintColor = .red
        }
        
        contentConfiguration = contentConfig
        backgroundConfiguration = backgroudConfig
    }
}
