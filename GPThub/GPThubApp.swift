//
//  chatGDPMenuBarApp.swift
//  chatGDPMenuBar
//
//  Created by Jack Vanderpump on 03/12/2022.
//

import SwiftUI

@main
struct GPThubApp: App {
    var body: some Scene {
        MenuBarExtra(K.appName, image: K.menuImage) {
            ContentView()
        }
    }
}
