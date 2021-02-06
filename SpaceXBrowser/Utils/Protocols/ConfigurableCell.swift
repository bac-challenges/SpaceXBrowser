//
//  ConfigurableCell.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import Foundation

public protocol ConfigurableCell {
    associatedtype T
    func configure(_ item: T)
}
