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
    @State private var showMenu = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            gptView
            buttons
        }
    }
    
    // MARK: - Components
    
    var gptView: some View {
        WebView()
            .frame(width: (NSScreen.main?.frame.width ?? 1000) * frameWidth,
                   height: (NSScreen.main?.frame.height ?? 1000) * frameHeight)
    }
    
    var buttons: some View {
        HStack(spacing: 0) {
            if showMenu {
                button("gear", action: openSettingsWindow)
                    .transition(.move(edge: .trailing))
                button("power", action: killApp)
                    .transition(.move(edge: .trailing))
            }
            button(showMenu ? "xmark" : "line.3.horizontal",
                   action: openMenu)
        }
    }
    
    func button(_ image: String, action: @escaping ()->()) -> some View {
        Button(action: action) {
            Image(systemName: image)
                .foregroundColor(.white.opacity(0.8))
                .font(.title2)
                .frame(width: 30, height: 30)
                .padding(10)
                .background(.indigo.opacity(0.7))
                .clipShape(Circle())
                .shadow(radius: 20)
                .padding(10)
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Actions
    
    func openMenu() {
        withAnimation {
            showMenu.toggle()
        }
    }
    
    func openSettingsWindow() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }
    
    func killApp() {
        NSApp.terminate(self)
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

