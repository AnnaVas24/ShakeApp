//
//  CollectionViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 07.04.2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let cocktails = Bundle.main.decode([Cocktail].self, from: "cocktails.json")
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Cocktail>!
    
    enum Section: Int, CaseIterable {
        case cocktails
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        title = "My collection"
        navigationController?.navigationBar.tintColor = .mainPurple()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.rightBarButtonItem = editButtonItem
        
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
        
    }
    
    @objc private func backButtonPressed(){
        dismiss(animated: true)
    }
    
    
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController?.searchBar.tintColor = #colorLiteral(red: 0.3961000144, green: 0.3227356672, blue: 0.6102760434, alpha: 1)
        searchController.searchBar.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)

        collectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell.reuseID)
        collectionView.delegate = self
        }

        private func reloadData() {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Cocktail>()
            snapshot.appendSections([.cocktails])
            snapshot.appendItems(cocktails, toSection: .cocktails)
            dataSource?.apply(snapshot, animatingDifferences: true)
        }
  
}
// MARK: - UISearchBarDelegate
extension CollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

// MARK: - UICollectionViewLayout
extension CollectionViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .cocktails:
                return self.createCocktailsSection()
            }
        }

        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        layout.configuration = configuration
        return layout
    }

    private func createCocktailsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(16)
        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 16, bottom: 0, trailing: 16)
        return section
    }

}

// MARK: - Data Source
extension CollectionViewController {

    private func createDataSource() {
           dataSource = UICollectionViewDiffableDataSource<Section, Cocktail>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) ->
            UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .cocktails:
                return self.configure(collectionView: collectionView, cellType: CocktailCell.self, with: user, for: indexPath)
            }
        })
    }
}

// MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cocktail = self.dataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        let destinationVC = CocktailDetailsViewController(cocktail: cocktail)
        let navVC = UINavigationController(rootViewController: destinationVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
// MARK: - SwiftUI
import SwiftUI

struct CollectionViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = CollectionViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CollectionViewControllerProvider.ContainerView>) -> CollectionViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: CollectionViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CollectionViewControllerProvider.ContainerView>) {
        }
    }
}
