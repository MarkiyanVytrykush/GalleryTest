//
//  Extensions.swift
//  GalleryTests
//
//  Created by Nanter on 2/12/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation
import UIKit

// MARK: -  extension getViewController
extension UIStoryboard {

    func getVC<T: UIViewController>() -> T {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}
// MARK: -  extension get dequeueReusableCell
extension UITableView {

    func getCell<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
}
