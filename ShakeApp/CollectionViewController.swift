//
//  CollectionViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 07.04.2022.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        title = "My collection"
        navigationController?.navigationBar.tintColor = .mainPurple()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        
        setupSearchBar()
        
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
  
}
// MARK: - UISearchBarDelegate
extension CollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
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
