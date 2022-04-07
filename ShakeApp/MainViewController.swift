//
//  MainViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 06.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainImageView = UIImageView(
        image: UIImage(named: "mainImage"),
        contentMode: .scaleAspectFit,
        cornerRadius: 20,
        borderColor: #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),
        borderWidth: 5)
    
    let welcomeLabel = UILabel(text: "What would you like to do today?", font: .futura22()!, textColor: .mainPurple())
    
    let luckButton = UIButton(title: "Try my luck!", titleColor: .white, backgroundColor: .mainPurple(), borderColor: #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1))
    let collectionButton = UIButton(title: "See my collection", titleColor: .white, backgroundColor: .mainPurple(), borderColor: #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1))
    
    let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.brightYellow(), for: .normal)
        button.titleLabel?.font = .futura20()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        title = "Hello"
        setupConstraints()
        luckButton.addTarget(self, action: #selector(goToCocktailVC), for: .touchUpInside)
        collectionButton.addTarget(self, action: #selector(goToCollection), for: .touchUpInside)
    }

    @objc private func goToCocktailVC(){
        let cocktailVC = CocktailViewController()
        let navVC = UINavigationController(rootViewController: cocktailVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    @objc private func goToCollection(){
        let collectionVC = CollectionViewController()
        let navVC = UINavigationController(rootViewController: collectionVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

// MARK: - Setup constraints
extension MainViewController {
    private func setupConstraints(){
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        luckButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        luckButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        collectionButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        collectionButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        let buttonsStack = UIStackView(arrangeSubviews: [luckButton, collectionButton], axis: .vertical, spacing: 15)
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(buttonsStack)
        view.addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: 205),
            mainImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 40),
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
// MARK: - SwiftUI
import SwiftUI

struct MainViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainViewControllerProvider.ContainerView>) -> MainViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: MainViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainViewControllerProvider.ContainerView>) {
        }
    }
}
