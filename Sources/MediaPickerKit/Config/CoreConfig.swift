//
//  CoreConfig.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//


import Foundation
import Photos

/// A configuration class to manage core settings for asset delivery.
final public class CoreConfig {

    // MARK: - Properties

    /// The desired quality level of asset delivery.
    let assetDeliveryQuality: DeliveryQuality

    /// The version of the asset to be delivered.
    let assetDeliveryVersion: DeliveryVersion

    /// A flag indicating whether network access is enabled for fetching assets.
    let isNetworkAccessEnabled: Bool

    // MARK: - Initializer

    /// Initializes a new instance of `CoreConfig` with specified parameters or default values.
    ///
    /// - Parameters:
    ///   - assetDeliveryQuality: The quality level of the asset delivery. Default is `.auto`.
    ///   - assetDeliveryVersion: The version of the asset to be delivered. Default is `.current`.
    ///   - isNetworkAccessEnabled: A boolean indicating if network access is enabled. Default is `true`.
    public init(
        assetDeliveryQuality: DeliveryQuality = .auto,
        assetDeliveryVersion: DeliveryVersion = .current,
        isNetworkAccessEnabled: Bool = true
    ) {
        self.assetDeliveryQuality = assetDeliveryQuality
        self.assetDeliveryVersion = assetDeliveryVersion
        self.isNetworkAccessEnabled = isNetworkAccessEnabled
    }
}
