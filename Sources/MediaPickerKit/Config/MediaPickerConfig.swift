//
//  MediaPickerConfig.swift
//  MediaPickerKit
//
//  Created by Faraz Karimi on 4/12/25.
//

import Foundation

/// A configuration class for customizing the behavior of a media picker.
final public class MediaPickerConfig {

    // MARK: - Properties

    /// The maximum number of media items selectable.
    let limit: Int

    /// The types of media that are allowed to be picked (e.g., photos, videos).
    let mediaTypes: [MediaType]

    /// The core configuration settings that apply to media handling and delivery.
    let coreConfig: CoreConfig

    // MARK: - Initializer

    /// Initializes a new instance of `MediaPickerConfig` with the specified parameters.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of media items the user can select.
    ///   - mediaTypes: An array of `MediaType` indicating which types of media are allowed.
    ///   - coreConfig: An optional `CoreConfig` instance with core settings, defaults to a new `CoreConfig` instance if not provided.
    public init(
        limit: Int,
        mediaTypes: [MediaType],
        coreConfig: CoreConfig = CoreConfig()
    ) {
        self.limit = limit
        self.mediaTypes = mediaTypes
        self.coreConfig = coreConfig
    }
}
