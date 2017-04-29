//
//  Developer.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

public struct Developer {
    var name : String
    var numberOfMaxibonsToGrap : Int
    
    init(name : String, numberOfMaxibonsToGrap :  Int) {
        self.name = name
        self.numberOfMaxibonsToGrap = numberOfMaxibonsToGrap < 0 ? 0 : numberOfMaxibonsToGrap
    }
}

open class Developers {
    open static let Pedro = Developer(name: "Pedro", numberOfMaxibonsToGrap: 3)
    open static let Jorge = Developer(name: "Jorge", numberOfMaxibonsToGrap: 2)
    open static let Fran = Developer(name: "Fran", numberOfMaxibonsToGrap: 1)
    open static let Davide = Developer(name: "Davide", numberOfMaxibonsToGrap: 0)
    open static let Sergio = Developer(name: "Sergio", numberOfMaxibonsToGrap: 1)
}
