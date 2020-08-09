//
//  HeaderView.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    // MARK: -PROPERTIES
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    @Binding var showProfileView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
//                self.showInfoView.toggle()
                withAnimation {
                    self.showProfileView.toggle()
                    }
            }) {
                Image(systemName: "person.circle")
                    .font(.system(size: 28, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) { InfoView() }
            
            Spacer()
            
//            Image("logo-honeymoon-pink")
//                .resizable()
//                .scaledToFill()
//                .frame(height: 28)
            Button(action: {
            withAnimation {
                self.showProfileView.toggle()
                }
            }) {
                Text("🤓").font(.system(size: 36))
            }
//            .sheet(isPresented: $showProfileView) { ModalProfileView() }

//            .sheet(isPresented: $showInfoView) { ModalView() }
            
//            .frame(height: 28)
            Spacer()
            
            Button(action: {
                self.showGuideView.toggle()
            }) {
                Image(systemName: "message.circle")
                .font(.system(size: 28, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
    .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    @State static var showProfile: Bool = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo, showProfileView: $showProfile)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
