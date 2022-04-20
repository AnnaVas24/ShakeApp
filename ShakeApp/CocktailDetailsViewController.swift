//
//  CocktailDetailsViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 20.04.2022.
//

import UIKit

class CocktailDetailsViewController: UIViewController {

    
    private let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        self.titleLabel.text = cocktail.cocktailName
        self.cocktailImage.image = UIImage(named: cocktail.photoStringURL)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel(text: "Cocktail Name", font: .futura22()!, textColor: .mainPurple())
    var cocktailImage: UIImageView = {
     let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1)
        imageView.layer.borderWidth = 2
        return imageView
    }()
    let nameLabel = UILabel(text: "Name:", font: .futura20()!, textColor: .mainPurple())
    let typeOfGlassLabel = UILabel(text: "Type of glass:", font: .futura20()!, textColor: .mainPurple())
    let ingredientsLabel = UILabel(text: "Ingredients:", font: .futura20()!, textColor: .mainPurple())
    let instructionsLabel = UILabel(text: "Instructions:", font: .futura20()!, textColor: .mainPurple())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        
        navigationController?.navigationBar.tintColor = .mainPurple()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        
        setupConstraints()
    }
    
    @objc private func backButtonPressed(){
        dismiss(animated: true)
    }

}

// MARK: - Setup constraints
extension CocktailDetailsViewController {
    private func setupConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cocktailImage.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.numberOfLines = 5
        
        let labelsStack = UIStackView(arrangeSubviews: [nameLabel, typeOfGlassLabel, ingredientsLabel, instructionsLabel], axis: .vertical, spacing: 6)
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.alignment = .leading
        
        
        view.addSubview(titleLabel)
        view.addSubview(cocktailImage)
        view.addSubview(labelsStack)
      
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            cocktailImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            cocktailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cocktailImage.widthAnchor.constraint(equalToConstant: 190),
            cocktailImage.heightAnchor.constraint(equalToConstant: 190)
        ])
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: cocktailImage.bottomAnchor, constant: 30),
            labelsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
}
// MARK: - SwiftUI
import SwiftUI

struct CocktailDetailsViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = CocktailDetailsViewController(cocktail: Cocktail(cocktailName: "a", photoStringURL: "a", id: 1))
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CocktailDetailsViewControllerProvider.ContainerView>) -> CocktailDetailsViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: CocktailDetailsViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CocktailDetailsViewControllerProvider.ContainerView>) {
        }
    }
}
