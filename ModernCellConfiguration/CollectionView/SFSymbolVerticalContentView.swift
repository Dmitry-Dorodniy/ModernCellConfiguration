//
//  SFSymbolVerticalContentView.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 26.08.2023.
//

import UIKit

class SFSymbolVerticalContentView: UIView, UIContentView {
    
    private var currentConfiguration: SFSymbolContentConfiguration!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? SFSymbolContentConfiguration else {
                return
            }
            apply(configuration: newConfiguration)
        }
    }
    
    init(configuration: SFSymbolContentConfiguration) {
        super.init(frame: .zero)
        
        setupAllViews()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension SFSymbolVerticalContentView {
    
    private func setupAllViews() {
  
        addSubview(stackView)
        stackView.addArrangedSubview(symbolImageView)
        stackView.addArrangedSubview(nameLabel)
        
        NSLayoutConstraint.activate([
                   stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                   stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                   stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                   stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
               ])
    }
    
    private func apply(configuration: SFSymbolContentConfiguration) {
        
        guard currentConfiguration != configuration else { return }
        
        currentConfiguration = configuration
        
        nameLabel.text = configuration.name
        nameLabel.textColor = configuration.nameColor
        
        if let fontWeight = configuration.fontWeight {
            nameLabel.font = UIFont.systemFont(ofSize: nameLabel.font.pointSize,
                                               weight: fontWeight)
        }
        
        if let symbolColor = configuration.symbolColor,
           let symbolWeight = configuration.symbolWeight {
            
            let symbolConfig = UIImage.SymbolConfiguration(weight: symbolWeight)
            var symbol = configuration.symbol?.withConfiguration(symbolConfig)
            symbol = symbol?.withTintColor(symbolColor, renderingMode: .alwaysOriginal)
            symbolImageView.image = symbol
        }
    }
}
