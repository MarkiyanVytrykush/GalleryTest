//
//  Album.swift
//  GalleryTests
//
//  Created by Nanter on 2/10/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

// MARK: -  Album
struct Album {

    let id: Int
    let title: String
    let photos: [Photo]

    var converPhoto: String? {
        return photos.first?.thumbnailUrl
    }
}
