//
//  Array.swift
//  SpaceXBrowser
//
//  Created by emile on 04/02/2021.
//

import Foundation

extension Array where Element == Launch {
    func prepare(years: Int) -> [Launch] {
        
        var items = self
        
        // sort by newest date
        items.sort {
            $0.dateUnix > $1.dateUnix
        }
        
        //
        guard let first = items.first?.dateUnix else {
            return [Launch]()
        }
        
        let startDate = Date(timeIntervalSince1970: first)
        guard let endDate = Calendar.current.date(byAdding: .year, value: years, to: Date()) else {
            return [Launch]()
        }
        
        let range = endDate...startDate

        items = items.filter { item -> Bool in
            let current = Date(timeIntervalSince1970: item.dateUnix)
            return range.contains(current)
        }
        
        return items
    }
}
