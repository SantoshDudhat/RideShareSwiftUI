//
//  RideShareApp.swift
//  RideShare
//
//  Created by DREAMWORLD on 16/12/24.
//

import SwiftUI
import GoogleMaps
import IQKeyboardManagerSwift

@main
struct RideShareApp: App {
    init() {
        IQKeyboardManager.shared.isEnabled = true
        GMSServices.provideAPIKey("AIzaSyCO4b1hTVt7IwK4mCcoCadaYnx56cnIXig")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
