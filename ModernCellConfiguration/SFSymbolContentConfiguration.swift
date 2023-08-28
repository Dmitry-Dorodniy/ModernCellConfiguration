//
//  SFSymbolContentConfiguration.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 26.08.2023.
//

import UIKit

struct SFSymbolContentConfiguration: UIContentConfiguration, Hashable {
    
    var name: String?
    var symbol: UIImage?
    var nameColor: UIColor?
    var symbolColor: UIColor?
    var symbolWeight: UIImage.SymbolWeight?
    var fontWeight: UIFont.Weight?
    
    func makeContentView() -> UIView & UIContentView {
        return SFSymbolVerticalContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> SFSymbolContentConfiguration {
        
        guard let state = state as? UICellConfigurationState else {
            return self
        }
        
        var updatedConfiguration = self
        if state.isSelected {
            updatedConfiguration.nameColor = .systemPink
            updatedConfiguration.symbolColor = .systemPink
            updatedConfiguration.fontWeight = .heavy
            updatedConfiguration.symbolWeight = .heavy
        } else {
            updatedConfiguration.nameColor = .systemBlue
            updatedConfiguration.symbolColor = .systemBlue
            updatedConfiguration.fontWeight = .regular
            updatedConfiguration.symbolWeight = .regular
        }
        
        return updatedConfiguration
    }
}
