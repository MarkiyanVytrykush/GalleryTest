//
//  ApiResponse.swift
//  GalleryTests
//
//  Created by Nanter on 2/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

enum PhotosApiResult {
    case success ([ApiPhotosResponce])
    case failure (Error)
}

enum Constants {
    static let baseUrl = "https://jsonplaceholder.typicode.com/photos"
    static let getMethod = "GET"
}

enum PhotosApiService {

    private static  let phototsRequest: URLRequest = {
        let url = URL(string: Constants.baseUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = Constants.getMethod
        return request
    }()

    static func getPhotos(completion: @escaping(PhotosApiResult) -> ()) {

        URLSession.shared.dataTask(with: phototsRequest) {data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let photos = try JSONDecoder().decode([ApiPhotosResponce].self, from: data)
                    completion(.success(photos))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}




