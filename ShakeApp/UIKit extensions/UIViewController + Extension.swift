//
//  UIViewController + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 20.04.2022.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfiguringCell, C: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: C, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else {fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: value)
        return cell
    }
}
