//
//  DeliveryVersion.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//


import Photos

@frozen
public enum DeliveryVersion {

    case current
    case original
    case unadjusted

    var phImageDeliveryVersion: PHImageRequestOptionsVersion {
        switch self {
        case .current:
            return .current
        case .original:
            return .original
        case .unadjusted:
            return .unadjusted
        }
    }
    
    var phVideoDeliveryVersion: PHVideoRequestOptionsVersion {
        switch self {
        case .current:
            return .current
        case .original, .unadjusted:
            return .original
        }
    }
}
