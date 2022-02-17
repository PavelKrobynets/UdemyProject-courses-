//
//  UdemyProjectApp.swift
//  UdemyProject
//
//  Created by mac on 23.08.2021.
//

import SwiftUI
import Firebase

@main
struct UdemyProjectApp: App {
    init() {
        FirebaseApp.configure() 
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}


