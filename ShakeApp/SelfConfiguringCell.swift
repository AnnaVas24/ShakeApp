//
//  SelfConfiguringCell.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 20.04.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String {get}
    func configure<C: Hashable>(with value: C)
}
