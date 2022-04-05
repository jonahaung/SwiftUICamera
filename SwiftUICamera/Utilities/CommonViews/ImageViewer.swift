//
//  ImageViewer.swift
//  SwiftUICamera
//
//  Created by Aung Ko Min on 5/4/22.
//

import SwiftUI

struct ImageViewer: View {
    
    let image: UIImage
    
    var body: some View {
        PickerNavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}
