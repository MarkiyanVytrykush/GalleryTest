//
//  GalleryTableViewController.swift
//  GalleryTests
//
//  Created by Nanter on 2/10/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - GalleryTableViewController
class GalleryTableViewController: UIViewController {

    var galleryTableViewModel: GalleryTableViewModel!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "GalleryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GalleryTableViewCell")

        tableView.estimatedRowHeight = 150
    }
}
// MARK: - GalleryTableViewControllerDelegate
extension GalleryTableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let photo = galleryTableViewModel.album.photos[indexPath.row]
        let photoViewModel = PhotoViewModel(with:photo)

        if let vc: PhotoViewController = storyboard?.getVC() {
            vc.photoViewModel = photoViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - GalleryTableViewControllerDataSource
extension GalleryTableViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryTableViewModel!.album.photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell: GalleryTableViewCell = tableView.getCell()
        let imageUrl = galleryTableViewModel!.album.photos[indexPath.row].thumbnailUrl

        cell.imageGalleryPhoto.url = imageUrl

        return cell
    }

}

