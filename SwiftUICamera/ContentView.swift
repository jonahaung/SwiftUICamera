//
//  ContentView.swift
//  SwiftUICamera
//
//  Created by Aung Ko Min on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Open Camera")
            .padding()
            .tapToPresent(CameraView(), .FullScreen)
    }
}
