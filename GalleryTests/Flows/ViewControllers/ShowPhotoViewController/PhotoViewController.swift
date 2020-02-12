//
//  ShowPhotoViewController.swift
//  GalleryTests
//
//  Created by Nanter on 2/10/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - PhotoViewController
class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageFullPhoto: CachedImageView!
    @IBOutlet weak var labelTitleToPhoto: UILabel!
    
    var photoViewModel: PhotoViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPhoto()
    }

    func setupPhoto() {

        let photo = photoViewModel.photos

        imageFullPhoto.url =  photo.url
        labelTitleToPhoto.text = photo.title
    }
}
