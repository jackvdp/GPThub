//
//  SettingsView.swift
//  GPThub
//
//  Created by Jack Vanderpump on 04/12/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
        }
    }
}

struct GeneralSettingsView: View {
    @AppStorage(K.Storage.frameHeight) var frameHeight: Double = K.Storage.defaultHeight
    @AppStorage(K.Storage.frameWidth) var frameWidth: Double = K.Storage.defaultWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            GroupBox(label: boxHeader) {
                slider(for: "Height", value: $frameHeight)
                slider(for: "Width", value: $frameWidth)
            }
            resetButton
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    var boxHeader: Text {
        Text("Menu Bar Window Size Relative to Screen:")
    }
    
    func slider(for name: String, value: Binding<Double>) -> some View {
        HStack(spacing: 20) {
            Text(name + ":")
            Spacer()
            Slider(
                value: value,
                in: 0...1
            )
            .frame(width: 150)
            Text("\(Int(value.wrappedValue * 100))%")
                .opacity(0.7)
                .padding(2)
                .frame(width: 40)
                .background(Color.secondary.colorInvert())
        }
    }
    
    var resetButton: some View {
        Button("Reset") {
            frameHeight = K.Storage.defaultHeight
            frameWidth = K.Storage.defaultWidth
        }
    }
}




struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralSettingsView()
    }
}
