//
//  AuthViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 04.04.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let mainImageView = UIImageView(
        image: UIImage(named: "mainImage"),
        contentMode: .scaleAspectFit,
        cornerRadius: 20,
        borderColor: #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),
        borderWidth: 5)
    
    let welcomeLabel = UILabel(text: "Welcome to ShakeApp!", font: .futura24()!, textColor: .mainPurple())
    let subtitleLabel = UILabel(text: "Please enter you login and password:", font: .futura20()!, textColor: .lightPurple())
    
    let loginTF = CustomizedTextField(placeholder: "Enter your login", image: UIImage(systemName: "person.circle")!)
    let passwordTF = CustomizedTextField(placeholder: "Enter your password", image: UIImage(systemName: "lock")!)
   
    let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.lightPurple(), for: .normal)
        button.titleLabel?.font = .futura20()
        return button
    }()
    
    let goButton = UIButton(title: "Go to cocktails!", titleColor: .white, backgroundColor: .mainPurple(), borderColor: #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1))
    
    let doNotHaveAccountLabel = UILabel(text: "Don’t have an account?", font: .futura20()!, textColor: .lightPurple())
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.mainPurple(), for: .normal)
        button.titleLabel?.font = .futura20()
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        
        setupConstraints()
    }
    
}

// MARK: - Setup constraints
extension AuthViewController {
    private func setupConstraints(){
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImageView)
        
        let labelsStackView = UIStackView(arrangeSubviews: [welcomeLabel, subtitleLabel], axis: .vertical, spacing: 10)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        loginTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginTF.widthAnchor.constraint(equalToConstant: 330).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordTF.widthAnchor.constraint(equalToConstant: 330).isActive = true
        let tfStackView = UIStackView(arrangeSubviews: [loginTF, passwordTF], axis: .vertical, spacing: 15)
        tfStackView.translatesAutoresizingMaskIntoConstraints = false
        
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        let signStackView = UIStackView(arrangeSubviews: [doNotHaveAccountLabel, signUpButton], axis: .horizontal, spacing: 0)
        signStackView.alignment = .firstBaseline
        signStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(labelsStackView)
        view.addSubview(tfStackView)
        view.addSubview(forgetPasswordButton)
        view.addSubview(goButton)
        view.addSubview(signStackView)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: 205),
            mainImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tfStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 30),
            tfStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tfStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            forgetPasswordButton.topAnchor.constraint(equalTo: tfStackView.bottomAnchor, constant: 10),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 20),
            goButton.widthAnchor.constraint(equalToConstant: 200),
            goButton.heightAnchor.constraint(equalToConstant: 45),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signStackView.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 40),
            signStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            signStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
    }
}
// MARK: - SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) -> AuthViewController {
           viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) {
        }
    }
}
