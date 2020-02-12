//
//  AlbumsViewModel.swift
//  GalleryTests
//
//  Created by Nanter on 2/10/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation
import Kingfisher

typealias  EmptyClouser = () -> Void

// MARK: - AlbumsViewModel
final class AlbumsViewModel {

    var didAlbumsFetched: EmptyClouser?
    var albums = [Album]()

    init () {
        getAlbum()
    }

    func getAlbum() {

        PhotosApiService.getPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.albums = Dictionary( grouping: photos, by: { $0.albumId }).map {
                    Album(id: $0.key,
                          title:"Album\($0.key) (\($0.value.first?.id ?? .zero )-\($0.value.last?.id ?? .zero))",
                        photos: $0.value.map {
                            Photo(id: $0.id, url: $0.url, title: $0.title, thumbnailUrl: $0.thumbnailUrl)
                    })
                }.sorted {$0.id < $1.id}

                self?.didAlbumsFetched?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
