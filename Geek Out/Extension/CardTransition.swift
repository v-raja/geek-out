//
//  CardTransition.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with:  .move(edge: .bottom)))
    }
    
   static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with:  .move(edge: .bottom)))
    }
}
