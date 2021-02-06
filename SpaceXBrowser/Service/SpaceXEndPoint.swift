//
//  SpaceXEndPoint.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import Foundation

enum SpaceXEndPoint: EndPoint {
    
    case launches
    case rocket(id: String)
    case image(url: String)
    
    var baseURL: URL {
        return URL(string: "https://api.spacexdata.com/v4/")!
    }
    
    var path: String {
        switch self {
        case .launches: return "\(baseURL)launches"
        case .rocket(let id): return "\(baseURL)rockets/\(id)"
        case .image(let url): return url
        }
    }
}
