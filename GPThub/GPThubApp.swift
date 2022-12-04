//
//  chatGDPMenuBarApp.swift
//  chatGDPMenuBar
//
//  Created by Jack Vanderpump on 03/12/2022.
//

import SwiftUI
import AppKit

@main
struct GPThubApp: App {
    var body: some Scene {
        MenuBarExtra(K.App.name, image: "Image") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
        Settings {
            SettingsView()
        }
    }
}
