//
//  SwiftChatApp.swift
//  Shared
//
//  Created by RUSLAN on 20.05.2021.
//

import SwiftUI
import Firebase





class AppDelegate: NSObject, UIApplicationDelegate {

//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("Your code here")
//        return true
//    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        if launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil {


       // Do what you want to happen when a remote notification is tapped.
        
        FirebaseApp.configure()

        
        Database.database().reference().child("ActiveView").child("TabView").setValue(6)

        NotificationCenter.default.addObserver(forName:UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { (_) in
              // Your Code here
            print("Зашел в приложение")
            Database.database().reference().child("AppsActive").child("isActive").setValue(true)
            
      }


        NotificationCenter.default.addObserver(forName:UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (_) in
               //  Дейсвтие при заходе в бекграунд режим
            print("Вышел из приложения")
            Database.database().reference().child("AppsActive").child("isActive").setValue(false)
        }

//       }

        return true
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("Приложение завершено")
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}




@main
struct SwiftChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
