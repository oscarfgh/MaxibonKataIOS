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
import Nimble

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
    
        property("If there are two maxibons after opening the fridge the developer not sends a message to buy more")
            <- forAll(Developer.arbitraryNotSoHungry) { (developer: Developer) in
                let chat = MockChat()
                let karumiHQs = KarumiHQs(chat: chat)
                karumiHQs.openFridge(developer: developer)
                return chat.messageSent == nil
        }
        
        property("The number of maxibons left can not be lower than two") <- forAll(Developer.arbitraryNotSoHungry, KarumiHQs.arbitrary) { (developer: Developer, karumiHQs: KarumiHQs) in
            print(developer)
            
            karumiHQs.openFridge(developer: developer)
            
            print("KarumiHQs maxibonleft \(karumiHQs.maxibonsLeft)")
            
            return karumiHQs.maxibonsLeft > 2
        }
    
    }
    
    func testGetFourMaxibons() {
        let developer = Developer(name: "Pedro", numberOfMaxibonsToGrap: 4)
        let karumiHQs = KarumiHQs()
        
        karumiHQs.openFridge(developer: developer)
        
        expect(karumiHQs.maxibonsLeft).to(equal(6))
    }
}
