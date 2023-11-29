//
//  FinalProjectVaccaApp.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import SwiftUI
import Firebase

@main
struct FinalProjectVaccaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            BookStoreView()
        }
    }
}
