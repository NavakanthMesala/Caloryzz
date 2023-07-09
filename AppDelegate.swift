//
//  AppDelegate.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import Foundation
import UIKit
import Firebase // Importing Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       FirebaseApp.configure() // Configuring Firebase
        return true
        }
     }
