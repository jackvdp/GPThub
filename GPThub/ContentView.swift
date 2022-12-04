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
        WebView()
            .frame(width: (NSScreen.main?.frame.width ?? 1000) * frameWidth,
                   height: (NSScreen.main?.frame.height ?? 1000) * frameHeight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

