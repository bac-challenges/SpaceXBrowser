//
//  SpaceXBrowserTests.swift
//  SpaceXBrowserTests
//
//  Created by emile on 04/02/2021.
//

@testable import SpaceXBrowser

import XCTest
import RxSwift

class SpaceXBrowserTests: XCTestCase, ServiceInjected, JSONDecoderInjected {

    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        InjectionMap.service = MockService()
        disposeBag = DisposeBag()
        
    }
    
    override func tearDown() {
        disposeBag = nil
        super.tearDown()
    }
    
    func testPrepareFilter() throws {
        service.get(endPoint: SpaceXEndPoint.launches)
            .debug()
            .decode(type: [Launch].self, decoder: jsonDecoder)
            .subscribe(onNext: { items in
                XCTAssertNotNil(items)
                XCTAssertEqual(items.count, 3)
                
                // Current year
                var filtered = items.prepare(years: 0)
                XCTAssertEqual(filtered.count, 1)
                
                // Last two years
                filtered = items.prepare(years: -1)
                XCTAssertEqual(filtered.count, 2)
                
                // Last 20 years
                filtered = items.prepare(years: -20)
                XCTAssertEqual(filtered.count, 3)

            }).disposed(by: disposeBag)
    }
}
