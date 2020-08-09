//
//  SignIn.swift
//  Geek Out
//
//  Created by Vivek on 27/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKLoginKit

struct SignInView: View {
    private var socialLogin: SocialLogin = SocialLogin()
    
    @Environment(\.presentationMode) var presentationMode

    
    func logginFb() {
        socialLogin.attemptLoginFb(completion: { result, error in
//        let fbLoginManager: LoginManager = LoginManager()
//        fbLoginManager.logOut()
//        fbLoginManager.logIn(permissions: ["email"], from: UIApplication.shared.windows.last?.rootViewController) { (result, error) in
        
            guard error == nil else {
                // Error occurred
                print(error!.localizedDescription)
                return
            }
            
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                return
            }
            
            GraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email"]).start() { (completion, result, err) in
                if err != nil {
                    print("Failed to start graph request: ", err!)
                    return
                }
                
                print(result!)
            }

            if AccessToken.current != nil {
                guard let FBaccessTokenString = AccessToken.current?.tokenString else { return }
                let FBcredentials = FacebookAuthProvider.credential(withAccessToken: FBaccessTokenString)
                
                Auth.auth().signIn(with: FBcredentials) {
                    (firebaseUser, err) in
                    if err != nil {
                        print("Error with authenticating FB user: ", (err?.localizedDescription)!)
                        return
                    }
                    print("Successfully logged in with user: ", firebaseUser!)
                }
            } else {
                print("ERROR! facebook access token is nil")
            }
            

        }
        )
    }
    
    func handleGoogleSignIn() {
//        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                        Capsule()
                        .frame(width: 120.0, height: 6.0)
                        .foregroundColor(Color.secondary)
                        .opacity(0.2)
                        .padding()
            
                        SignInButtonComponent(icon: "f_logo_RGB-White_100", description: "Facebook", action: {
                            self.presentationMode.wrappedValue.dismiss()
                            self.logginFb()
                        }, color: Color(red: Double(24/255.0), green: Double(119/255.0), blue: Double(242/255.0)))
                        
                        
                        SignInButtonComponent(icon: "google", description: "Google", action: {
                            self.presentationMode.wrappedValue.dismiss()
                            self.handleGoogleSignIn()
//                            self.socialLogin.attemptLoginGoogle()
                        }, color: Color.red)
                        
                        SignInButtonComponent(icon: "apple-512", description: "Apple", action: {                self.presentationMode.wrappedValue.dismiss()
                        }, color: Color.black)
                
                        SignInButtonComponent(icon: "sms", description: "SMS", action: {                self.presentationMode.wrappedValue.dismiss()
                            }, color: Color.green)
                        
                        Text("By signing in you indicate that you have read and agree to Geek Out's Terms of Service and Privacy Policy")
                            .font(.system(.footnote, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding()
                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//            .padding(.top, UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top)
                //                    .padding(.top, 15)
                    .padding(.bottom, 25)
                    .padding(.horizontal, 25)
//            .frame(alignment: .top)
        }
//            .frame(alignment: .top)
        .edgesIgnoringSafeArea(.all)
//            .offset(x: 0, y: (UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.frame.height)!)
//        .offset(x: 0, y: -(UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.frame.height)! + 100)
        .offset(x: 0, y: -100)
//                    .frame(height: 500, alignment: .top)
    }
}

    
struct SocialLogin: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
    }

    func attemptLoginGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }

    func attemptLoginFb(completion: @escaping (_ result: LoginManagerLoginResult?, _ error: Error?) -> Void) {
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logOut()
        fbLoginManager.logIn(permissions: ["email"], from: UIApplication.shared.windows.last?.rootViewController) { (result, error) -> Void in
            completion(result, error)
        }
    }
    
    func handleFBLogin() {
//        LoginManager().logIn(permissions: ["email"], viewController: <#T##UIViewController?#>, completion: <#T##LoginResultBlock?##LoginResultBlock?##(LoginResult) -> Void#>)
    }

}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        SignInView()
            .previewLayout(.sizeThatFits)
    }
}




