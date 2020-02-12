//
//  UITableViewController.swift
//  GalleryTests
//
//  Created by Nanter on 2/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

// MARK: - AlbumsTableViewController
class AlbumsTableViewController: UIViewController {

    private var albums = [Album]()
    private var albumsViewModel = AlbumsViewModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let reuseIdentifier = String(describing: AlbumsTableViewCell.self)
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)

        configureViewModel()
    }

    func configureViewModel() {
        albumsViewModel.didAlbumsFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

// MARK: -  AlbumsTableViewDataSource
extension AlbumsTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsViewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: AlbumsTableViewCell = tableView.getCell()
        cell.albumNameLabelText.text = albumsViewModel.albums[indexPath.row].title
        let imagePhotoUrl = albumsViewModel.albums[indexPath.row].converPhoto!
        cell.imagePhotoTitleAlbum.url = imagePhotoUrl

        return cell
    }


}

// MARK: -  AlbumsTableViewDelegate
extension AlbumsTableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let album = albumsViewModel.albums[indexPath.row]
        let galleryTableViewModel = GalleryTableViewModel(with: album)

        if let vc: GalleryTableViewController = storyboard?.getVC() {
            vc.galleryTableViewModel = galleryTableViewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


