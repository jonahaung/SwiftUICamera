//
//  FullScreenPresenting.swift
//  MyBike
//
//  Created by Aung Ko Min on 29/11/21.
//

import SwiftUI

internal enum ModelType {
    case FullScreen, Sheet
}

struct TapToPresentStyle<Destination: View>: ViewModifier {
    
    let destination: Destination
    let modelType: ModelType
    
    @State private var isSheet = false
    @State private var isFullScreen = false
    
    
    func body(content: Content) -> some View {
        Button {
            switch modelType {
            case .FullScreen:
                isFullScreen = true
            case .Sheet:
                isSheet = true
            }
        } label: {
            content
        }
        .fullScreenCover(isPresented: $isFullScreen) {
            destination
        }
        .sheet(isPresented: $isSheet) {
            destination
        }
    }
}


extension View {
    func tapToPresent<Destination: View>(_ view: Destination, _ modelType: ModelType = .Sheet) -> some View {
        ModifiedContent(content: self, modifier: TapToPresentStyle(destination: view, modelType: modelType))
    }
}
