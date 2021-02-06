//
//  Rocket.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import Foundation

struct Rocket: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case flickrImages
        case descr = "description"
        case link = "wikipedia"
    }
    
    let name: String
    let flickrImages: [String]
    let descr: String
    let link: String
}

// MARK: Helpers
extension Rocket {
    var image: String {
        return flickrImages.first ?? ""
    }
}
