//
//  AppDelegate.swift
//  Geek Out
//
//  Created by Vivek on 23/06/2020.
//  Copyright © 2020 Vivek Raja. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // for fb login
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )


        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        let _ = ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    // For Google sign-in
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }

    
    // For Google sign-in
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      if let error = error {
        print(error.localizedDescription)
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) {
            (res, error) in
            if (error != nil) {
                print((error?.localizedDescription)!)
                return
            }
            print("user=" + (res?.user.email)!)
        }
        
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//          if let error = error {
//            let authError = error as NSError
//            if (isMFAEnabled && authError.code == AuthErrorCode.secondFactorRequired.rawValue) {
//              // The user is a multi-factor user. Second factor challenge is required.
//              let resolver = authError.userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
//              var displayNameString = ""
//              for tmpFactorInfo in (resolver.hints) {
//                displayNameString += tmpFactorInfo.displayName ?? ""
//                displayNameString += " "
//              }
//              self.showTextInputPrompt(withMessage: "Select factor to sign in\n\(displayNameString)", completionBlock: { userPressedOK, displayName in
//                var selectedHint: PhoneMultiFactorInfo?
//                for tmpFactorInfo in resolver.hints {
//                  if (displayName == tmpFactorInfo.displayName) {
//                    selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
//                  }
//                }
//                PhoneAuthProvider.provider().verifyPhoneNumber(with: selectedHint!, uiDelegate: nil, multiFactorSession: resolver.session) { verificationID, error in
//                  if error != nil {
//                    print("Multi factor start sign in failed. Error: \(error.debugDescription)")
//                  } else {
//                    self.showTextInputPrompt(withMessage: "Verification code for \(selectedHint?.displayName ?? "")", completionBlock: { userPressedOK, verificationCode in
//                      let credential: PhoneAuthCredential? = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: verificationCode!)
//                      let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator.assertion(with: credential!)
//                      resolver.resolveSignIn(with: assertion!) { authResult, error in
//                        if error != nil {
//                          print("Multi factor finanlize sign in failed. Error: \(error.debugDescription)")
//                        } else {
//                          self.navigationController?.popViewController(animated: true)
//                        }
//                      }
//                    })
//                  }
//                }
//              })
//            } else {
//              self.showMessagePrompt(error.localizedDescription)
//              return
//            }
//            // ...
//            return
//          }
          // User is signed in
          // ...
//        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    // For facebook log-in
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(app, open: url, options: options)
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

