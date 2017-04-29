//
//  KarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

final public class KarumiHQs {
    var maxibonsLeft = 10
    
    func openFridge(developer : Developer) {
        maxibonsLeft -= developer.numberOfMaxibonsToGrap
        
        if maxibonsLeft < 0 {
            maxibonsLeft = 0
        }
        
        if maxibonsLeft <= 2 {
           maxibonsLeft += 10
        }
    }
    
    func openFridge(developers : [Developer]) {
        for developer in developers {
            openFridge(developer: developer)
        }
    }
}
