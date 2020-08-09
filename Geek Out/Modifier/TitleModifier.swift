//
//  TitleModifier.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.largeTitle)
        .foregroundColor(Color.pink)
    }
}
