//
//  RocketCoordinator.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

final class RocketCoordinator: Coordinator {
    
    var item: Launch?
    
    weak var navigation: UINavigationController?
    private var controller: RocketController?
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "RocketVC") as? RocketController
        
        guard let rocketViewController = controller, let item = item else { return }
        rocketViewController.rocket = item.rocket
            
        navigation?.pushViewController(rocketViewController, animated: true)
    }
}
