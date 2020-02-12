//
//  TableViewCell.swift
//  GalleryTests
//
//  Created by Nanter on 2/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var albumNameLabelText: UILabel!
    @IBOutlet weak var imagePhotoTitleAlbum: CachedImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
