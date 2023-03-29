//
//  Tic_Tac_ToeApp.swift
//  Tic Tac Toe
//
//  Created by Iris GalGal on 17/03/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
