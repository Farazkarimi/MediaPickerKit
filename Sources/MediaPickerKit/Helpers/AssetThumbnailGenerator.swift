//
//  AssetThumbnailGenerator.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//


import UIKit
import Photos

/// A utility class to generate and request asset thumbnails.
public class AssetThumbnailGenerator {

    // MARK: - Properties

    /// The image manager responsible for caching and fetching images.
    private let imageManager: PHCachingImageManager

    /// Options for configuring the image request behavior.
    private let requestOptions: PHImageRequestOptions

    // MARK: - Initializer

    /// Initializes the `AssetThumbnailGenerator` with a specific image manager and request options.
    ///
    /// - Parameters:
    ///   - imageManager: The image manager used for caching images.
    ///   - requestOptions: The options to use when requesting images.
    public init(
        imageManager: PHCachingImageManager,
        requestOptions: PHImageRequestOptions
    ) {
        self.imageManager = imageManager
        self.requestOptions = requestOptions
    }

    // MARK: - Methods

    /// Generates a thumbnail for a given asset.
    ///
    /// - Parameters:
    ///   - asset: The asset for which the thumbnail is to be generated.
    ///   - targetSize: The desired size of the thumbnail.
    ///   - completion: A closure to handle the result of the request.
    /// - Returns: The request ID of the image request, useful for canceling or tracking the request.
    func generateThumbnail(for asset: PHAsset, targetSize: CGSize, completion: @escaping (UIImage?) -> Void) -> ImageRequestID {

        // Request the image from the image manager using the specified options.
        return imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: requestOptions) { image, _ in
            completion(image)
        }
    }
}
