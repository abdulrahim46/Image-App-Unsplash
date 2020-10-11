//
//  Constant.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import Foundation

struct Constant {
    
    struct Unsplash {
        static let baseURL = "https://api.unsplash.com/"
        static let accessKey = "QCauL1KMtXbjCdNib8iIoGxKWgHJsfWmqU4pQlKTly8"
    }
    
    struct APIParameterKey {
        static let page = "page"
    }

    struct FireStore {
        
        struct Collections {
            static let likedPhotos = "LikedPhotos"
        }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptVersion = "Accept-Version"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum NetWorkError: Error {
    case badURL(String?)
    case decodingError(String?)
}

