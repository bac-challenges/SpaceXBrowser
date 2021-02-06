//
//  Mock.swift
//  SpaceXBrowserTests
//
//  Created by emile on 05/02/2021.
//

@testable import SpaceXBrowser

import Foundation
import RxSwift

struct MockService: Service {
    func get(endPoint: EndPoint) -> Observable<Data> {
        
        guard let endPoint = endPoint as? SpaceXEndPoint else {
            fatalError("Invalid End Point")
        }
        
        var data: Data
        
        switch endPoint {
        case .launches: data = loadData("Launches")
        case .rocket: data = loadData("rocket")
        default: data = Data()
        }
        
        return Observable.just(data)
    }
    
    private func loadData(_ fileName: String) -> Data {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                // handle error
            }
        }
        return Data()
    }
}
