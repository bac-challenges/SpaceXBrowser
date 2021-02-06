//
//  RocketViewModel.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol RocketViewModelProtocol {
    func load(rocket: String)
    func load(image: String)
    func open(_ url: String)
    var item: PublishSubject<Rocket> { get set }
    var image: PublishSubject<UIImage> { get set }
}

final class RocketViewModel: RocketViewModelProtocol, ServiceInjected, JSONDecoderInjected {
    
    var item = PublishSubject<Rocket>()
    var image = PublishSubject<UIImage>()
    
    private let disposeBag = DisposeBag()
    
    func load(rocket: String) {
        service.get(endPoint: SpaceXEndPoint.rocket(id: rocket))
            .debug()
            .decode(type: Rocket.self, decoder: jsonDecoder)
            .subscribe { [weak self] rocket in
                if let item = rocket.element {
                    self?.item.onNext(item)
                }
            }.disposed(by: disposeBag)
    }
    
    func load(image: String) {
        service.get(endPoint: SpaceXEndPoint.image(url: image))
            .debug()
            .subscribe { [weak self] item in
                if let data = item.element {
                    guard let image = UIImage(data: data) else {
                        fatalError(("Invalid data"))
                    }
                    self?.image.onNext(image)
                }
            }.disposed(by: disposeBag)
    }
    
    func open(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
