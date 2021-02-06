//
//  Service.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
}

protocol Service {
    func get(endPoint: EndPoint) -> Observable<Data>
}

struct RemoteService: Service {
    func get(endPoint: EndPoint) -> Observable<Data> {
        
        guard let url = URL(string: endPoint.path) else {
            fatalError("endpoint is not an URL object")
        }
        
        let request = URLRequest(url: url)
        
        return URLSession.shared.rx.data(request: request).retry(3)
    }
}
