//
//  KarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Óscar García on 29/4/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

public final class KarumiHQs {
    fileprivate let chat : Chat
    var maxibonsLeft = 10
    
    public init(chat: Chat) {
        self.maxibonsLeft = 10
        self.chat = chat
    }
    
    public init(maxibonsLeft: Int) {
        self.maxibonsLeft = maxibonsLeft
        self.chat = Slack()
    }
    
    public convenience init() {
        self.init(chat: Slack())
    }
    
    func openFridge(developer : Developer) {
        maxibonsLeft -= developer.numberOfMaxibonsToGrap
        
        if maxibonsLeft < 0 {
            maxibonsLeft = 0
        }
        
        if maxibonsLeft <= 2 {
           notifyWeShouldBuyMaxibons(developer)
           maxibonsLeft += 10
        }
    }
    
    func openFridge(developers : [Developer]) {
        for developer in developers {
            openFridge(developer: developer)
        }
    }
    
    fileprivate func notifyWeShouldBuyMaxibons(_ developer: Developer) {
        let message = "Hi guys, I'm \(developer). We need more maxibons!"
        chat.send(message: message)
    }
}
