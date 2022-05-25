//
//  ChatDemoApp.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import SwiftUI
import Firebase

@main
struct ChatDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
