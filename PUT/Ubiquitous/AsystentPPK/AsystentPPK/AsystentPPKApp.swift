//
//  AsystentPPKApp.swift
//  AsystentPPK
//
//  Created by student on 10/06/2024.
//

import SwiftUI
import SwiftData
@main
struct AsystentPPKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Deposit.self)
    }
}
