//
//  CocktailCell.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 14.04.2022.
//

import UIKit

class CocktailCell: UICollectionViewCell, SelfConfiguringCell {
   
    let cocktailImageView = UIImageView()
    let cocktailName = UILabel(text: "Cocktail Name", font: .futura20()!, textColor: .black)
    let containerView = UIView()
 
    
    static var reuseID = "CocktailCell"
    
    func configure<C>(with value: C) where C : Hashable {
        guard let cocktail:Cocktail = value as? Cocktail else {return}
        cocktailImageView.image = UIImage(named: cocktail.photoStringURL)
        cocktailName.text = cocktail.cocktailName
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 4
        self.containerView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        cocktailImageView.image = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Constraints
extension CocktailCell {
    private func setupConstraints(){
        cocktailImageView.translatesAutoresizingMaskIntoConstraints = false
        cocktailName.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(cocktailImageView)
        containerView.addSubview(cocktailName)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            cocktailImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cocktailImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            cocktailImageView.heightAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cocktailName.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor),
            cocktailName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cocktailName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            cocktailName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
