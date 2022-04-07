//
//  SignUpViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 06.04.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    let mainLabel = UILabel(text: "Create Your Account", font: .futura24()!, textColor: .mainPurple())
    let subtitleLabel = UILabel(text: "Please fill out all required fields:", font: .futura20()!, textColor: .lightPurple())
    
    let nameTF = CustomizedTextField(placeholder: "Name", image: UIImage(systemName: "person.circle")!)
    let emailTF = CustomizedTextField(placeholder: "E-mail", image: UIImage(systemName: "envelope")!)
    let passwordTF = CustomizedTextField(placeholder: "Password", image: UIImage(systemName: "lock")!)
    let confirmPasswordTF = CustomizedTextField(placeholder: "Confirm password", image: UIImage(systemName: "lock")!)
    
    let saveButton = UIButton(title: "SAVE", titleColor: .white, backgroundColor: .mainPurple(), borderColor: #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1))
    
    let alreadyHaveAccountLabel = UILabel(text: "Have already an account?", font: .futura20()!, textColor: .lightPurple())
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.mainPurple(), for: .normal)
        button.titleLabel?.font = .futura20()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()

        setupConstraints()
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }

    @objc private func saveButtonPressed(){
        let rootVC = MainViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

// MARK: - Setup constraints
extension SignUpViewController {
    private func setupConstraints(){
        let labelsStackView = UIStackView(arrangeSubviews: [mainLabel, subtitleLabel], axis: .vertical, spacing: 10)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.alignment = .center
        view.addSubview(labelsStackView)
        
        let tfStackView = UIStackView(arrangeSubviews: [nameTF, emailTF, passwordTF, confirmPasswordTF], axis: .vertical, spacing: 15)
        tfStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tfStackView)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(saveButton)
        
        let signStackView = UIStackView(arrangeSubviews: [alreadyHaveAccountLabel, signInButton], axis: .horizontal, spacing: 0)
        signStackView.alignment = .firstBaseline
        signStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tfStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 30),
            tfStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tfStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: tfStackView.bottomAnchor, constant: 40),
            saveButton.widthAnchor.constraint(equalToConstant: 180),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            signStackView.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 40),
            signStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            signStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpViewControllerProvider.ContainerView>) -> SignUpViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: SignUpViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpViewControllerProvider.ContainerView>) {
        }
    }
}
