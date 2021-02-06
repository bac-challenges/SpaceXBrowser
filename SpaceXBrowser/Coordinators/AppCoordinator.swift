//
//  AppCoordinator.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

final class AppCoordinator: UIWindowInjected, LaunchCoordinatorInjected, Coordinator {

    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }()
        
    func start() {
        window.rootViewController = navigationController
        showLaunch()
    }
    
    func showLaunch()
    {
        launchCoordinator.navigation = navigationController
        launchCoordinator.start()
    }
}
