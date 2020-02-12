//
//  CachedImageView.swift
//  GalleryTests
//
//  Created by Nanter on 2/12/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Kingfisher

class CachedImageView: UIImageView {

    var url = String() {
        didSet {
            setImage()
        }
    }

    private func setImage() {

        guard let url = URL(string: url) else {
            image = nil
            return
        }

        kf.setImage(with: url)
    }
}
