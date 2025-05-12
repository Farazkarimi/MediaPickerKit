//
//  MediaType.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//

import Photos

@frozen
public enum MediaType {

    case image
    case video

    var phAssetMediaType: PHAssetMediaType {
        switch self {
        case .image:
            return .image
        case .video:
            return .video
        }
    }
}
