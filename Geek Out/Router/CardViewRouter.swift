//
//  CardViewRouter.swift
//  Geek Out
//
//  Created by Vivek on 27/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class CardViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<CardViewRouter,Never>()
    var orig_card_view: Bool = true {
        didSet {
            objectWillChange.send(self)
        }
    }
    
}
