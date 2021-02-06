//
//  LaunchViewModel.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol LaunchViewModelProtocol: LaunchCoordinatorInjected, ServiceInjected, JSONDecoderInjected {
    
    var items: PublishSubject<[Launch]> { get set }
    
    func load()
    func itemSelected(_ item: Launch)
}

final class LaunchViewModel: LaunchViewModelProtocol {

    var items = PublishSubject<[Launch]>()

    private let disposeBag = DisposeBag()
    
    func load() {
        service.get(endPoint: SpaceXEndPoint.launches)
            .decode(type: [Launch].self, decoder: jsonDecoder)
            .subscribe { [weak self] launches in
                if let items = launches.element {
                    
                    let result = items.prepare(years: -3)
                    
                    self?.items.onNext(result)
                    self?.items.onCompleted()
                }
            }.disposed(by: disposeBag)
    }
    
    func itemSelected(_ item: Launch) {
        launchCoordinator.itemSelected(item)
    }
}
