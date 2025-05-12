//
//  AssetDetails.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//

import Foundation

/// A protocol that signifies asset detail types. 
/// It imposes no specific requirements but serves as a common type for asset detail structures.
public protocol AssetDetails { }

/// A structure for holding details about video assets.
/// Extend this struct to include any new properties that need to be extracted from video assets.
public struct VideoAssetDetails: AssetDetails {
    
    /// The duration of the video in seconds. It is optional and may not be available for all assets.
    var duration: Double?
}
