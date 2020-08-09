//
//  ContentView.swift
//  Geek Out
//
//  Created by Vivek on 23/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct PreSignInView: View {
    
    // MARK: - PROPERTIES
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @State var altCardView: Bool = false
    @GestureState private var dragState = DragState.inactive
    
//    @ObservedObject var cardViewRouter: CardViewRouter = CardViewRouter()

    
    // threshold after which x-mark or heart is displayed on card
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    // MARK: - AUTH
    @EnvironmentObject var session: SessionStore

    func getUser() {
        session.listen()
    }
    
    // MARK: - CARD VIEWS
    @State var cardViews: [CardView] = []
    
    
    // MARK: MOVE THE CARD
    private func moveCard() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let person = peopleData[lastCardIndex % peopleData.count]
        
        let newCardView = CardView(person: person,
                                   altView: $altCardView)
        
        cardViews.append(newCardView)
    }
    
    // MARK: -TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    // MARK: -DRAG STATE
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .dragging, .pressing:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    var body: some View {
        Group {
        if (session.session == nil)
        {
//            Text("show auth screen")
            SignInView()
            .padding()
        }
        else
        {
            
        VStack {
            // MARK: - HEADER
//            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
//                .opacity(dragState.isDragging ? 0.0 : 1.0)
//                .animation(.default)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) {
                    cardView in cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                    .overlay(
                        ZStack {
                            // X-MARK on card when swiping
                            Image(systemName: "x.circle")
                            .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            // HEART on card when swiping
                            Image(systemName: "heart.circle")
                            .modifier(SymbolModifier())
                            .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                        }
                    )
                        .cornerRadius(24)
                        // offset, scaleEffect, rotationEffect control the feel of the swiping gesture. The animation is for when the card is left
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.90: 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 24) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .onTapGesture { }
                        // code below senses gesture on card and updates the variable dragState accordingly.
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: {(value, state, transition) in switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                                }
                            })
                            .onChanged({ (value) in guard case .second(true, let drag?) = value else { return }
                                
                                if drag.translation.width < -self.dragAreaThreshold {
                                    self.cardRemovalTransition = .leadingBottom
                                }
                                
                                if drag.translation.width > self.dragAreaThreshold {
                                    self.cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded({(value) in
                                guard case .second(true, let drag?) = value else { return }
                                
                                if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                    self.moveCard()
                                }
                            })
                    ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            .onAppear {
                var views = [CardView]()
                for index in 0..<2 {
                    views.append(
                        CardView(person: peopleData[index],
                                 altView: self.$altCardView))
//                                 cardViewRouter: self.cardViewRouter))
                    self.cardViews = views
                }
                
            }
        
        
            Spacer()
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert, altCardView: $altCardView)
//                .opacity(dragState.isDragging ? 0.0 : 1.0)
//                .animation(.default)
        }
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Let the good times roll."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
        } // end else
        } // End Group
        .onAppear(perform: getUser)
    }
}

struct PreSignInView_Previews: PreviewProvider {
    static var previews: some View {
        PreSignInView()
        .previewDevice("iPhone 11 Pro")
        .environmentObject(SessionStore())
    }
}
