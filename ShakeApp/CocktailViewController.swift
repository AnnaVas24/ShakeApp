//
//  CocktailViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 07.04.2022.
//

import UIKit

class CocktailViewController: UIViewController {
    
    let titleLabel = UILabel(text: "Your cocktail for today is:", font: .futura22()!, textColor: .mainPurple())
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
    let saveButton = UIButton(title: "Save to my collection", titleColor: .mainPurple(), backgroundColor: .mainWhite(), borderColor: #colorLiteral(red: 0.3961000144, green: 0.3227356672, blue: 0.6102760434, alpha: 1))
    let tryButton = UIButton(title: "Try another one", titleColor: .white, backgroundColor: .mainPurple(), borderColor: #colorLiteral(red: 0.3961000144, green: 0.3227356672, blue: 0.6102760434, alpha: 1))
    
    private var activityIndicator: UIActivityIndicatorView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setupNavBar()
        setupConstraints()
        
        cocktailImage.showLoading()

        
    }
    
    @objc private func goToCollection(){
        
    }
    
    @objc private func backButtonPressed(){
        dismiss(animated: true)
    }
    
    private func setupNavBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "See my collection", style: .plain, target: self, action: #selector(goToCollection))
        navigationController?.navigationBar.tintColor = .mainPurple()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
    }
    
    

}

// MARK: - Setup constraints
extension CocktailViewController {
    private func setupConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cocktailImage.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.numberOfLines = 5
        
        let labelsStack = UIStackView(arrangeSubviews: [nameLabel, typeOfGlassLabel, ingredientsLabel, instructionsLabel], axis: .vertical, spacing: 6)
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.alignment = .leading
        
        saveButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tryButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        tryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let buttonsStack = UIStackView(arrangeSubviews: [saveButton, tryButton], axis: .vertical, spacing: 10)
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(titleLabel)
        view.addSubview(cocktailImage)
        view.addSubview(labelsStack)
        view.addSubview(buttonsStack)
        
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
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 200),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct CocktailViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = CocktailViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CocktailViewControllerProvider.ContainerView>) -> CocktailViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: CocktailViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CocktailViewControllerProvider.ContainerView>) {
        }
    }
}
