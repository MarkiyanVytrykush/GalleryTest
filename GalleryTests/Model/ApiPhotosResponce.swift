//
//  ApiPhotosResponce.swift
//  GalleryTests
//
//  Created by Nanter on 2/10/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

// MARK: -  ApiPhotosResponce
struct ApiPhotosResponce: Codable, Equatable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
