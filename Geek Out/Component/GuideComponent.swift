//
//  GuideComponent.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: -PROPERTIES
    
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20.0) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color.pink)
            VStack(spacing: 4.0) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                }
                Divider().padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(
            title: "Title",
            subtitle: "Swipe right",
        description: "This is place hodler. This is place hodler. This is place hodler. lorem ipsom daoduaufsusf ",
        icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
