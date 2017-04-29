//
//  ArbitraryKarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import SwiftCheck

@testable import MaxibonKataIOS

extension KarumiHQs : Arbitrary {

    public static var arbitrary : Gen<KarumiHQs> {
        return Int.arbitrary.map {
            return KarumiHQs(maxibonsLeft: $0)
        }
    }
    
}
