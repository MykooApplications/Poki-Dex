//
//  Poki_DexApp.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 3/24/22.
//

import SwiftUI

@main
struct Poki_DexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
