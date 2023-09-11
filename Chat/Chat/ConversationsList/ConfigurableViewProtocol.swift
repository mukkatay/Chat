//
//  ConfigurableViewProtocol.swift
//  Chat
//
//  Created by Akyl Mukatay  on 10.09.2023.
//

import Foundation

protocol ConfigurableViewProtocol {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}
