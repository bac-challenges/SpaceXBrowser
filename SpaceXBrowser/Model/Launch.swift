//
//  Launch.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import Foundation

struct Launch: Codable {
    let id: String
    let name: String
    let details: String?
    let flightNumber: Int
    let rocket: String
    let upcoming: Bool
    let dateUnix: Double
}

// MARK: Helpers
extension Launch {
    var date: String {
        return Date(timeIntervalSince1970: dateUnix).toString(withFormat: "dd MMM yyyy")
    }
}
