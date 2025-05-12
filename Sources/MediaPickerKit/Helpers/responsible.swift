//
//  VideoDetailsGenerator.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//


import UIKit
import Photos

/// A class responsible for generating video details from assets.
public class VideoDetailsGenerator: AssetDetails {

    // MARK: - Properties
    
    /// An instance of the image manager used for caching and managing video assets.
    private let imageManager: PHCachingImageManager
    
    /// Options for configuring video request behaviors.
    private let options: PHVideoRequestOptions
    
    // MARK: - Initializer
    
    /// Initializes a new instance of `VideoDetailsGenerator` with the given image manager and options.
    ///
    /// - Parameters:
    ///   - imageManager: The image manager to use for asset caching and requesting.
    ///   - options: The video request options to apply during asset fetching.
    init(imageManager: PHCachingImageManager, options: PHVideoRequestOptions) {
        self.imageManager = imageManager
        self.options = options
    }
    
    // MARK: - Methods
    
    /// Extracts video properties from a given `PHAsset` and returns them through a completion handler.
    ///
    /// - Parameters:
    ///   - asset: The `PHAsset` from which to extract video details.
    ///   - completion: A closure that handles the resulting video asset details.
    public func getAssetProperties<T: AssetDetails>(asset: PHAsset, completion: @escaping ((T) -> Void)) {
        
        var videoProperties = VideoAssetDetails()  // Create a new instance to hold video properties
        
        // Request a player item for the given video asset to extract its properties
        imageManager.requestPlayerItem(forVideo: asset, options: options) { playerItem, _ in
            
            if let duration = playerItem?.duration {
                // Convert CMTime duration to seconds and assign it to the videoProperties
                let durationInSeconds = CMTimeGetSeconds(duration)
                videoProperties.duration = durationInSeconds
            }
            
            // Cast and return the properties through the completion handler
            if let properties = videoProperties as? T {
                completion(properties)
            } else {
                print("Error: Could not cast VideoAssetDetails to the expected type \(T.self)")
            }
        }
    }
}
