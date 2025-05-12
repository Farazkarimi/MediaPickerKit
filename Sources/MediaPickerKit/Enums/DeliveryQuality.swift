//
//  DeliveryQuality.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//

import Photos

@frozen
public enum DeliveryQuality {

    case high
    case fast
    case auto

    var phImageDeliveryQuality: PHImageRequestOptionsDeliveryMode {
        switch self {
        case .high:
            return .highQualityFormat
        case .fast:
            return .fastFormat
        case .auto:
            return .opportunistic
        }
    }
}
