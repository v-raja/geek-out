//
//  FooterView.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTIES
    
    @Binding var showBookingAlert: Bool
    @Binding var altCardView: Bool
    
    @EnvironmentObject var session: SessionStore

    
    var body: some View {
        HStack {
//                Image(systemName: "xmark.circle")
//                    .font(.system(size: 42, weight: .light))
            
            Button(action: {
                self.altCardView.toggle()
            }) {
//                Image(systemName: "arrow.uturn.down.circle")
//                    .font(.system(size: 42, weight: .light))
                Image(systemName: "xmark")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(.red)
//                .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
            }
            .accentColor(Color.primary)
            
            Spacer()
            
            
            if (session.session == nil)
            {
                    
                Button(action: {
                    self.showBookingAlert.toggle()
    //                self.altCardView.toggle()
                }) {
                    Text("Sign in".lowercased())
                        .font(.system(size: 19, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .accentColor(.white)
                    .background(
                        Capsule()
                            .foregroundColor(.yellow)
    //                        .stroke(Color.pink, lineWidth: 2)
                    )
                }
                .sheet(isPresented: $showBookingAlert) { SignInView() }

                Spacer()
            }
            
            Button(action: session.signOut) {
            Image(systemName: "heart.fill")
                .font(.system(size: 36, weight: .heavy, design:.rounded))
                .foregroundColor(.green)
            }
        }
    .padding()
        .onAppear(perform: session.listen)
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    @State static var altCardView: Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert, altCardView: $altCardView)
            .previewLayout(.fixed(width: 375, height: 80))
            .environmentObject(SessionStore())
    }
}
