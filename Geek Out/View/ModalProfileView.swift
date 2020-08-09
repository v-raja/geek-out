//
//  ModalProfileView.swift
//  Geek Out
//
//  Created by Vivek on 28/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct ModalProfileView: View {
    
    @Binding var showProfileView: Bool
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color.white)
        //                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.red.opacity(0.2), lineWidth: 1))
                        .shadow(color: Color.black.opacity(0.4), radius: 4)
                    
                    ScrollView {
                        ProfileView(person: peopleData[0])
        //                .padding(.horizontal)

                    }
                    .cornerRadius(24)
                }
                    
        //            VStack {
                        Spacer()
        ////                ModalButton(showModal: self.$showModal)
        //            }.padding(.vertical)
                    HStack(alignment: .bottom, spacing: 20) {
                    Button(action: {
                        withAnimation {
                        self.showProfileView.toggle()
                        }//                        self.presentationMode.wrappedValue.dismiss()

        //                            self.showBookingAlert.toggle()
                    //                self.altCardView.toggle()
                                }) {
                                    Text("save".lowercased())
                                        .font(.system(size: 19, design: .rounded))
                                        .fontWeight(.heavy)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 20)
                                        .accentColor(.white)
                                    .background(
                                        Capsule()
                                            .foregroundColor(.green)
                    //                        .stroke(Color.pink, lineWidth: 2)
                                    )
                    }
                        Button(action: {
                            withAnimation {
                            self.showProfileView.toggle()
                            }
//                            self.presentationMode.wrappedValue.dismiss()

                        //                            self.showBookingAlert.toggle()
                                    //                self.altCardView.toggle()
                                                }) {
                                                    Text("cancel".lowercased())
                                                        .font(.system(size: 19, design: .rounded))
                                                        .fontWeight(.heavy)
                                                        .padding(.vertical, 12)
                                                        .padding(.horizontal, 20)
                                                        .accentColor(.white)
                                                    .background(
                                                        Capsule()
                                                            .foregroundColor(.red)

                                                    )
                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                    .padding(.horizontal)

                .padding(.top, 80)
                .padding(.bottom)
    }
}

struct ModalProfileView_Previews: PreviewProvider {
    @State static var showProfile: Bool = false

    static var previews: some View {
        ModalProfileView(showProfileView: $showProfile)
//        ProfileView()
    }
}
