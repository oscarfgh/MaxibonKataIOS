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
        
        property("If there are two or less maxibons after opening the fridge the developer sends a message to buy more")
            <- forAll(Developer.arbitraryHungry) { (developer: Developer) in
                let chat = MockChat()
                let karumiHQs = KarumiHQs(chat: chat)
                karumiHQs.openFridge(developer: developer)
                return chat.messageSent == "Hi guys, I'm \(developer). We need more maxibons!"
                
        }
    }
}
