//
//  CursedPongApp.swift
//  Pong
//
//  Created by Sima Nerush on 4/3/22.
//

import SwiftUI

@main
struct CursedPongApp: App {
    var body: some Scene {
        WindowGroup {
            CursedMenuView()
                .onAppear {
                    MusicPlayer.shared.startBackgroundMusic()
            }
        }
    }
}
