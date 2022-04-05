//
//  ViewController.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 29.03.2022.
//

import UIKit

class ViewController: UIViewController {

    private var cocktail: Cocktail?
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktail()
        
    }

    private func fetchCocktail() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let cocktail):
                self.cocktail = cocktail
                print(cocktail)
                
            case .failure(let error):
                print(error)
            }
        }
    }

}

