//
//  CollectionListViewController.swift
//  ModernCellConfiguration
//
//  Created by Dmitry Dorodniy on 25.08.2023.
//

import UIKit

class CollectionListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    var dataSource: UICollectionViewDiffableDataSource<Section, SFSymbolItem>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, SFSymbolItem>!

    private lazy var listCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionLayout())
        collection.delegate = self
        return collection
    }()
    
//    let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SFSymbolItem> { cell, indexPath, item in
//        var content = cell.defaultContentConfiguration()
//        content.image = item.image
//        content.text = item.name
//        
//        cell.contentConfiguration = content
//    }
//    
    let cellRegistration = UICollectionView.CellRegistration<SFSymbolVerticalListCell, SFSymbolItem> { (cell, indexPath, item) in
        
        // For custom cell, we just need to assign the data item to the cell.
        // The custom cell's updateConfiguration(using:) method will assign the
        // content configuration to the cell
        cell.item = item
    }
    
    
    func setupCollectionLayout() -> UICollectionViewCompositionalLayout {
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        return listLayout
    }
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, SFSymbolItem>(collectionView: listCollection) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: SFSymbolItem) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration,
                                                                    for: indexPath,
                                                                    item: identifier)
            // Configure cell appearance
            cell.accessories = [.disclosureIndicator()]
            
            return cell
        }
    }
    
    func setupSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Section, SFSymbolItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(SFSymbolItem.dataItems, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
   
                                                        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listCollection.frame = view.bounds
        listCollection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(listCollection)
        setupDataSource()
        setupSnapshot()
    }
}

extension CollectionListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = dataSource.itemIdentifier(for: indexPath) else { collectionView.deselectItem(at: indexPath, animated: true)
            return
        }
        
        let alert = UIAlertController(title: selectedItem.name, message: "", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            collectionView.deselectItem(at: indexPath, animated: true)
        }

        alert.addAction(okAction)
//        present(alert, animated: true)
    }
}
