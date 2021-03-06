//
//  DeveloperSpec.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck

@testable import MaxibonKataIOS

class DeveloperSpec: XCTestCase {
    fileprivate let anyName = "Pedro"
    fileprivate let anyNumberOfMaxibonsToGet = 11
    
    func testTheNumberOfMaxibonsPerKarumieAre() {
        XCTAssertEqual(3, Developers.Pedro.numberOfMaxibonsToGrap)
        XCTAssertEqual(0, Developers.Davide.numberOfMaxibonsToGrap)
        XCTAssertEqual(1, Developers.Fran.numberOfMaxibonsToGrap)
        XCTAssertEqual(2, Developers.Jorge.numberOfMaxibonsToGrap)
        XCTAssertEqual(1, Developers.Sergio.numberOfMaxibonsToGrap)
    }
    
    func testAll() {
        property("Number of maxibons to sonsume can not ve negative") <- forAll { (numberOfMaxibons: Int) in
            let developer = Developer(name: "AnyName", numberOfMaxibonsToGrap: numberOfMaxibons)
            print(developer)
            return developer.numberOfMaxibonsToGrap >= 0
        }
        
        property("The number of maxibons is asigned if is positive or zero")
            <- forAll { (positiveNumber: NonNegative<Int>) in
                let numberOfMaxibons = positiveNumber.getNonNegative
                let developer = Developer(name: self.anyName, numberOfMaxibonsToGrap: numberOfMaxibons)
                return developer.numberOfMaxibonsToGrap == numberOfMaxibons
        }

    }

}


