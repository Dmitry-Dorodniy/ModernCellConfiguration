//
//  SFSymbolVerticalListCell.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 28.08.2023.
//

import UIKit

class SFSymbolVerticalListCell: UICollectionViewListCell {
    
    var item: SFSymbolItem?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        
        var newConfiguration = SFSymbolContentConfiguration().updated(for: state)
        newConfiguration.name = item?.name
        newConfiguration.symbol = item?.image
        contentConfiguration = newConfiguration
        
        var newBgConfiguration = UIBackgroundConfiguration.listGroupedCell()
        newBgConfiguration.backgroundColor = .systemBackground
        backgroundConfiguration = newBgConfiguration
    }
}
