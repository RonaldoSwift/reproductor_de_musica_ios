//
//  reproductor_de_musica_iosApp.swift
//  reproductor_de_musica_ios
//
//  Created by Ronaldo Andre Vargas Huaman on 17/08/22.
//

import SwiftUI

@main
struct reproductor_de_musica_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomePantallaView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
