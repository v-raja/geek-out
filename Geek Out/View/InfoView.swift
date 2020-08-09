//
//  InfoView.swift
//  Geek Out
//
//  Created by Vivek on 24/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    // MARK: -PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack(alignment: .center, spacing: 20.0) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                .modifier(TitleModifier())
                CreditsView()
                Spacer(minLength: 10)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                        Text("Continue".uppercased()).modifier(ButtonModifier())
                    }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone / iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Vivek")
            RowAppInfoView(itemOne: "Version", itemTwo: "0.0.1")
        }
    }
}

struct RowAppInfoView: View {
    // MARK: -PROPERTIES
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack() {
            Text(itemOne).foregroundColor(.gray)
            Spacer()
            Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack {
                Text("Photos")
                    .foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            
            Text("Photographers").foregroundColor(.gray)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
            
        }
    }
}
