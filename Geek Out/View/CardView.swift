//
//  CardView.swift
//  Geek Out
//
//  Created by Vivek on 23/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - PROPERTIES
//    #19A186#F2CF43 Unplanned Intercourse gradient
    
    let id = UUID()
    var person: Person
//    @ObservedObject var cardViewRouter: CardViewRouter
    
    @Binding var altView: Bool
    
//    init(person: Person, cardViewRouter: CardViewRouter) {
//    init(person: Person, altView: Binding<Bool>) {
//        self.person = person
////        self.cardViewRouter = cardViewRouter
//        self._altView = altView
//        UIScrollView.appearance().bounces = false
//    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - IMAGE CARD
                if (!altView) {
                    CardImageView(person: person)
                }
                
                // MARK: - INFO CARD
                Text(person.bio)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 20.0)
                    .padding(.bottom, 35.0)
                    .padding(.horizontal, 20.0)

                
                Text("I like geeking out on...")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                    
                
                Text(person.geek_out_on)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15.0)
                    .padding(.bottom, 35.0)
                    .padding(.horizontal, 20.0)

                
                Text("My other interests are...")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                    
                
                Text(person.other_interests)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15.0)
                    .padding(.bottom, 35.0)
                    .padding(.horizontal, 20.0)
                
                Text("I'd be keen if someone would like to...")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                    
                
                Text(person.activities)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15.0)
                    .padding(.bottom, 35.0)
                    .padding(.horizontal, 20.0)
                
                Text(person.open_minded ? "I'm open-minded to other activities😋" : "I'd prefer to do one of the activites I've listed😊")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 35.0)
                
                if (altView) {
                    CardImageView(person: person)
                }
            }
            
        }
        .background(Color(red: 0.584, green: 0.976, blue: 0.522, opacity: 1.0)) //        149, 249, 133
    }
}

struct CardView_Previews: PreviewProvider {
    @State static var altCardView: Bool = false
    

    static var previews: some View {
        CardView(person: peopleData[0],
                 altView: $altCardView)
//                 cardViewRouter: CardViewRouter())
//            .previewLayout(.fixed(width: 375, height: 600))
            .previewLayout(.sizeThatFits)
    }
}

struct CardImageView: View {
    var person: Person
    
    var body: some View {
        Image(person.image)
            .resizable()
            //                    .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay (
                Rectangle()
                    .fill (
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                       startPoint: UnitPoint(x: 0.5, y: 0.9), endPoint: .bottom))
                    .clipped()
                    .opacity(0.6))
            .overlay(
                VStack(alignment: .leading, spacing: 0)
                {
                    Text(person.first_name + ", " + String(person.age))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 1)
                    Text("Edinburgh, UK")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)

                    //                        .padding(.vertical, 4)
                }
                .padding(.horizontal, 18)
                .frame(minWidth: 200)
                .padding(.bottom, 10),
                alignment: .bottomLeading)
    }
}

struct CardInfoView: View {
    var person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
        Text(person.bio)
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.top, 20.0)
            .padding(.bottom, 35.0)
            .padding(.horizontal, 20.0)

        
        Text("I like geeking out on...")
            .font(.headline)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 20.0)
            
        
        Text(person.geek_out_on)
            .font(.system(size: 24))
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.top, 15.0)
            .padding(.bottom, 35.0)
            .padding(.horizontal, 20.0)

        
        Text("My other interests are...")
            .font(.headline)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 20.0)
            
        
        Text(person.other_interests)
            .font(.system(size: 24))
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.top, 15.0)
            .padding(.bottom, 35.0)
            .padding(.horizontal, 20.0)
        
        Text("I'd be keen if someone would like to...")
            .font(.headline)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 20.0)
            
        
        Text(person.activities)
            .font(.system(size: 24))
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.top, 15.0)
            .padding(.bottom, 35.0)
            .padding(.horizontal, 20.0)
        
        Text(person.open_minded ? "I'm open-minded to other activities😋" : "I'd prefer to do one of the activites I've listed😊")
            .font(.headline)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 20.0)
            .padding(.bottom, 35.0)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
