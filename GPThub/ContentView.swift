//
//  ContentView.swift
//  chatGDPMenuBar
//
//  Created by Jack Vanderpump on 03/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(K.Storage.frameHeight) var frameHeight: Double = K.Storage.defaultHeight
    @AppStorage(K.Storage.frameWidth) var frameWidth: Double = K.Storage.defaultWidth
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            gptView
            settingsButton
        }
    }
    
    var gptView: some View {
        WebView()
            .frame(width: (NSScreen.main?.frame.width ?? 1000) * frameWidth,
                   height: (NSScreen.main?.frame.height ?? 1000) * frameHeight)
    }
    
    var settingsButton: some View {
        Button(action: openSettingsWindow) {
            buttonView
        }
        .buttonStyle(.plain)
    }
    
    var buttonView: some View {
        Image(systemName: "gear")
            .foregroundColor(.white.opacity(0.8))
            .padding(10)
            .font(.title)
            .background(.indigo.opacity(0.7))
            .clipShape(Capsule())
            .padding(10)
            .shadow(radius: 20)
    }
    
    func openSettingsWindow() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

