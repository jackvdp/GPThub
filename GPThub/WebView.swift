//
//  WebView.swift
//  chatGDPMenuBar
//
//  Created by Jack Vanderpump on 03/12/2022.
//

import WebKit
import AppKit
import SwiftUI

struct WebView: NSViewRepresentable {
    
    typealias NSViewType = WKWebView
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
        webView.load(URLRequest(url: URL(string: K.gptURL)!))
    }
    
    func makeNSView(context: Context) -> WKWebView {
        webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        //
    }
    
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
