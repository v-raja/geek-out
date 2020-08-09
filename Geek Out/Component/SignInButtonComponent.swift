//
//  SignInButtonComponent.swift
//  Geek Out
//
//  Created by Vivek on 27/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI


struct SignInButtonComponent: View {
    var icon: String
    var description: String
    var action: () -> Void
    var color: Color

    var body: some View {
        Button(action: action) {
            HStack(alignment: .top) {
            Image(icon)
                .resizable()
                .frame(width: 19, height: 19)
                .scaledToFill()
            Text("Continue with " + description)
                .font(.system(size: 19))
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .accentColor(Color.white)
        .background(
            Capsule()
            .fill(color))}
    }
}

struct SignInButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
//        SignInButtonComponent(icon: "f_logo_RGB-White_72", systemIcon: false, description: "facebook", action: {}, color: Color.blue)
//            .previewLayout(.sizeThatFits)
                    SignInButtonComponent(icon: "apple-512", description: "Apple", action: {}, color: Color.black)


    }
}
