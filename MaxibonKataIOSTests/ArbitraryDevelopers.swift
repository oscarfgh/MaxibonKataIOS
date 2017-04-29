//
//  ArbitraryDevelopers.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import SwiftCheck

@testable import MaxibonKataIOS

extension Developer : Arbitrary {
    
    public static var arbitrary : Gen<Developer> {
        return Int.arbitrary.map {
            let name = String.arbitrary.generate
            return Developer(name: name, numberOfMaxibonsToGrap: $0)
        }
    }
    
    public static var arbitraryHungry : Gen<Developer> {
        return Gen<Int>.fromElementsIn(8...Int.max).map {
            let name = String.arbitrary.generate
            return Developer(name: name, numberOfMaxibonsToGrap: $0)
        }
    }
    
    
    public static var arbitraryNotSoHungry : Gen<Developer> {
        return Gen<Int>.fromElementsIn(0...7).map {
            let name = String.arbitrary.generate
            return Developer(name: name, numberOfMaxibonsToGrap: $0)
        }
    }
}
