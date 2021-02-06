//
//  LaunchCell.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import UIKit

final class LaunchCell: UITableViewCell, ReusableCell, ConfigurableCell {
    
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var flightDateLabel: UILabel!
    @IBOutlet weak var flightUpcoming: UILabel!
    @IBOutlet weak var flightNameLabel: UILabel!
    @IBOutlet weak var flightDetailLabel: UILabel!
    
    func configure(_ item: Launch) {
        flightNumberLabel.text = "Launch: \(item.flightNumber)"
        flightDateLabel.text = item.date
        flightUpcoming.alpha = item.upcoming ? 1:0
        flightNameLabel.text = item.name
        flightDetailLabel.text = item.details
    }
}
