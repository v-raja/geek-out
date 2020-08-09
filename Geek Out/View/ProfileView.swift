//
//  ProfileView.swift
//  Geek Out
//
//  Created by Vivek on 28/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var person: Person
    var altView: Bool = false
    @State private var bio: String = ""
    @State private var bio_height: CGFloat = 48
    @State private var geek_out_on: String = ""
    @State private var other_interests: String = ""
    @State private var activities: String = ""
    
    @EnvironmentObject var multiTextPropertiesStore : MultiTextPropertiesStore
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - IMAGE CARD
                if (!altView) {
                    CardImageView(person: person)
                }
                
                // MARK: - INFO CARD
                MultiTextField(text: $bio, height: $bio_height, initalText: "New to Edinburgh and looking to make friends!", font_size: 26 )
                    .frame(height: bio_height)
                .padding(.top, 20.0)
                .padding(.bottom, 35.0)
                .padding(.horizontal, 20.0)
//                TextField("New to Edinburgh and looking to make friends!", text: $bio)
//                .font(.title)
//                    .font(.system(size: 12, weight: .regular, design: .default))
//                .multilineTextAlignment(.leading)
//                .padding(.top, 20.0)
//                .padding(.bottom, 35.0)
//                .padding(.horizontal, 20.0)

//                Text(person.bio)
//                    .font(.title)
//                    .fontWeight(.regular)
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//                    .padding(.top, 20.0)
//                    .padding(.bottom, 35.0)
//                    .padding(.horizontal, 20.0)

                
                Text("I like geeking out on...")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                    
                
                TextField("The probability we're in a simulation🤔\nSpace🛰🚀\nFacts about plants🌸\nAnything Cog Sci/Programming/Math/Philosophy📚\nSomething technical here...", text: $geek_out_on)
                     .font(.system(size: 24, weight: .regular, design: .default))
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
                    
                
                TextField("Sci-Fi🖖\nAnime\nUnderstanding conciousness / Being present 🌸\nGaming🧝‍♀️👾🕹\nDisney movies🧚‍♀️🧜‍♀️", text: $other_interests)
                    .font(.system(size: 24, weight: .regular, design: .default))
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
                    
//                UITextView(
                TextField("Play chess, Hike🌲, Build a compiler together, Work on a Space-related project together🤓, Help me with my yoga😅", text: $activities)
                    .font(.system(size: 24, weight: .regular, design: .default))
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
                
//                if (altView) {
//                    CardImageView(person: person)
//                }
            }
            
        }
        .background(Color(red: 0.584, green: 0.976, blue: 0.522, opacity: 1.0)) //        149, 249, 133
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(person: peopleData[0])
        .previewLayout(.sizeThatFits)
    }
}

struct MultiTextField : UIViewRepresentable {
    
    @Binding var text : String
    @Binding var height : CGFloat
    
    func makeCoordinator() -> Coordinator {
        return MultiTextField.Coordinator(parent: self)
    }
    
    var initalText : String
    var font_size : CGFloat
        
    func makeUIView(context: UIViewRepresentableContext<MultiTextField>) -> UITextView {
        
        let view = UITextView()
        view.font = .systemFont(ofSize: self.font_size, weight: .regular)
        view.text = initalText
        view.textColor = UIColor.black.withAlphaComponent(0.2)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        view.isEditable = true
        view.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        self.height = view.contentSize.height
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiTextField>) {
        
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        var parent : MultiTextField
        
        init(parent : MultiTextField) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            self.parent.height = textView.contentSize.height
        }
    }
}


class MultiTextPropertiesStore : ObservableObject {
    @Published var size : CGFloat = 0
}
