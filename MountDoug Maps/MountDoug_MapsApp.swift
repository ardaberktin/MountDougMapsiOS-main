//
//  MountDoug_MapsApp.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MountDoug_MapsApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var favs = Favourites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(favs)
        }
    }
}
