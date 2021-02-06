//
//  LaunchCoordinator.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

final class LaunchCoordinator: RocketCoordinatorInjected, Coordinator {
    
    weak var navigation: UINavigationController?
    private var controller: LaunchController?

    func start() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "LaunchVC") as? LaunchController
        
        guard let listViewController = controller else { return }
        
        navigation?.pushViewController(listViewController, animated: false)
    }
    
    func itemSelected(_ item: Launch) {
        rocketCoordinator.navigation = navigation
        rocketCoordinator.item = item
        rocketCoordinator.start()
    }
}
