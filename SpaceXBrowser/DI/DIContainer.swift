//
//  DIContainer.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

struct InjectionMap {
    static var service: Service = RemoteService()
    static var launchViewModel: LaunchViewModelProtocol = LaunchViewModel()
    static var rocketViewModel: RocketViewModelProtocol = RocketViewModel()
}

// MARK: Service
protocol ServiceInjected {}

extension ServiceInjected {
    var service: Service { get { return InjectionMap.service } }
}

// MARK: LaunchViewModel
protocol LaunchViewModelInjected {}

extension LaunchViewModelInjected {
    var viewModel: LaunchViewModelProtocol { get { return InjectionMap.launchViewModel } }
}

// MARK: RocketViewModel
protocol RocketViewModelInjected {}

extension RocketViewModelInjected {
    var viewModel: RocketViewModelProtocol { get { return InjectionMap.rocketViewModel } }
}



// MARK: - Coordinators
extension InjectionMap {
    static var appCoordinator = AppCoordinator()
    static var launchCoordinator = LaunchCoordinator()
    static var rocketCoordinator = RocketCoordinator()
}

// MARK: AppCoordinator
protocol AppCoordinatorInjected {}

extension AppCoordinatorInjected {
    var appCoordinator: AppCoordinator { get { return InjectionMap.appCoordinator } }
}

// MARK: LaunchCoordinator
protocol LaunchCoordinatorInjected {}

extension LaunchCoordinatorInjected {
    var launchCoordinator: LaunchCoordinator { get { return InjectionMap.launchCoordinator } }
}

// MARK: RocketCoordinator
protocol RocketCoordinatorInjected {}

extension RocketCoordinatorInjected {
    var rocketCoordinator: RocketCoordinator { get { return InjectionMap.rocketCoordinator } }
}



// MARK: - Utils
extension InjectionMap {
    
    static var window = UIWindow()
    
    static var jsonDecoder: JSONDecoder  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }
}

// MARK: UIWindow
protocol UIWindowInjected {}

extension UIWindowInjected {
    var window: UIWindow { get { return InjectionMap.window } }
}

// MARK: JSONDecoder
protocol JSONDecoderInjected {}

extension JSONDecoderInjected {
    var jsonDecoder: JSONDecoder { get { return InjectionMap.jsonDecoder } }
}
