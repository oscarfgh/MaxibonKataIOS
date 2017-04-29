//
//  KarumiHQsSpec.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck

@testable import MaxibonKataIOS

class KarumiHQsSpec: XCTestCase {
    
    func testAll() {
        property("The number of maxibons left can not be lower than two") <- forAll{ (name : String, numberOfMaxibons: Int) in
            let developer = Developer(name: name, numberOfMaxibonsToGrap: numberOfMaxibons)
            print(developer)
            
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer: developer)

            return karumiHQs.maxibonsLeft > 2
        }
        
        property("The number of maxibons left can not be lower than two") <- forAll{ (devs : [Developer]) in
            print(devs)
            
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developers: devs)

            return karumiHQs.maxibonsLeft > 2
        }
    }
}
