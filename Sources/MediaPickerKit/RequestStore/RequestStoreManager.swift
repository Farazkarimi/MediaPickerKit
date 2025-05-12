//
//  RequestStoreManager.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//


import UIKit
import Photos

typealias ImageRequestID = Int32

public final class RequestStoreManager {

    private(set) var assets: PHFetchResult<PHAsset>?
    private let imageManager = PHCachingImageManager()
    private let pickerConfig: MediaPickerConfig

    init(pickerConfig: MediaPickerConfig) {
        self.pickerConfig = pickerConfig
    }
    

    func fetchAssets() -> Bool {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Two options exists Image or video, if count one then use the same else fetch everything from gallery
        if pickerConfig.mediaTypes.count == 1 {
            assets = PHAsset.fetchAssets(with: pickerConfig.mediaTypes.first!.phAssetMediaType, options: fetchOptions)
        } else {
            assets = PHAsset.fetchAssets(with: fetchOptions)
        }
        return ((assets?.count ?? 0) != 0)
    }
    
    /// Asset thumbnail generator
    /// - Parameters:
    ///   - asset: asset for which thumbnail needs to be calculated
    ///   - targetSize: image size to be returned
    ///   - completion: block which notifies when image and duration is computed
    /// - Returns: A numeric identifier for the request.
    func getAssetThumbnail(asset: PHAsset, targetSize: CGSize, completion: @escaping (_ image: UIImage?) -> Void) -> ImageRequestID {
        /// Calls respective generator
        /// i.e. `MPThumbnailGenerator`
        let thumbnailGenerator = AssetThumbnailGenerator(imageManager: imageManager, requestOptions: getImageRequestOptions())
        let imageRequestId = thumbnailGenerator.generateThumbnail(for: asset, targetSize: targetSize, completion: completion)

        /// Returns the photo request id
        return imageRequestId
    }

    func getVideoProperties(asset: PHAsset, completion: @escaping ((VideoAssetDetails) -> Void)) {

        /// Calls respective generator
        /// i.e. `MPVideoDetailsGenerator`
        let videoPropertyGenerator = VideoDetailsGenerator(imageManager: imageManager, options: getVideoRequestOptions())
        videoPropertyGenerator.getAssetProperties(asset: asset, completion: completion)
       
    }

    /// Image caching mechanism
    /// - Parameters:
    ///   - assets: asset to be cached
    ///   - targetSize: size of image to be cached
    func cacheImage(assets: [PHAsset], targetSize: CGSize) {
        
        let options = getImageRequestOptions()
        
        self.imageManager.startCachingImages(for: assets, targetSize: targetSize, contentMode: .aspectFill, options: options)
    }
    
    /// Cancels the Image caching request
    /// - Parameter id: request id obtained while caching was initiated
    func cancelImageRequest(id: Int) {
        imageManager.cancelImageRequest(PHImageRequestID(id))
    }
    
    /// Stops all the caching process
    func stopCaching() {
        self.imageManager.stopCachingImagesForAllAssets()
    }
    
}

private extension RequestStoreManager {

    /// Image Request options
    func getImageRequestOptions() -> PHImageRequestOptions {
        
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.version = pickerConfig.coreConfig.assetDeliveryVersion.phImageDeliveryVersion
        options.deliveryMode = pickerConfig.coreConfig.assetDeliveryQuality.phImageDeliveryQuality
        options.isNetworkAccessAllowed = pickerConfig.coreConfig.isNetworkAccessEnabled

        return options
    }
    
    /// Video Request options
    func getVideoRequestOptions() -> PHVideoRequestOptions {
        
        let options = PHVideoRequestOptions()
        options.version = pickerConfig.coreConfig.assetDeliveryVersion.phVideoDeliveryVersion
        options.deliveryMode = .fastFormat
        options.isNetworkAccessAllowed = pickerConfig.coreConfig.isNetworkAccessEnabled
        
        return options
    }
}
