//
//  App168App.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_SgbLjKANx2NDqoF5bcSDiaLbkJqPb7")
        Amplitude.instance().initializeApiKey("fdf541f16184e5f557da4ade564d1e5a")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App168App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
