//
//  Photo.swift
//  SwiftCamera
//
//  Created by Aung Ko Min on 5/4/22.
//

import Combine
import AVFoundation
import Photos
import UIKit

//  MARK: Class Camera Service, handles setup of AVFoundation needed for a basic camera app.
public struct Photo: Identifiable, Equatable {
//    The ID of the captured photo
    public var id: String
//    Data representation of the captured photo
    public var originalData: Data
    
    public init(id: String = UUID().uuidString, originalData: Data) {
        self.id = id
        self.originalData = originalData
    }
}
extension Photo {
    public var compressedData: Data? {
        ImageResizer(targetWidth: 800).resize(data: originalData)?.jpegData(compressionQuality: 0.5)
    }
    public var thumbnailData: Data? {
        ImageResizer(targetWidth: 100).resize(data: originalData)?.jpegData(compressionQuality: 0.5)
    }
    public var thumbnailImage: UIImage? {
        guard let data = thumbnailData else { return nil }
        return UIImage(data: data)
    }
    public var image: UIImage? {
        guard let data = compressedData else { return nil }
        return UIImage(data: data)
    }
}
