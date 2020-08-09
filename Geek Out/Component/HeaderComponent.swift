//
//  HeaderComponent.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            Capsule()
                .frame(width: 120.0, height: 6.0)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28.0)
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
