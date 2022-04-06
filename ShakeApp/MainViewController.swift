//
//  MainViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 06.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

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
