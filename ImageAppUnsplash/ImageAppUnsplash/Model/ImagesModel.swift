//
//  ImagesModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import Foundation

import Foundation

struct ImagesModel: Decodable, Equatable {
    let id: String?
    let urls: URLS?
    let user: User?
    let likes: Int?
    
    
    init(id: String, urls: URLS, user: User, likes: Int) {
        self.id = id
        self.urls = urls
        self.user = user
        self.likes = likes
    }
}

struct URLS: Decodable, Equatable {
   let raw: String?
   let full: String?
   let regular: String?
   let small: String?
   let thumb: String?
    
    
    init(raw: String, full: String, regular: String, small: String, thumb: String) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
    }
}

struct User: Decodable, Equatable {
    let username: String?
    
    init(userName: String) {
        self.username = userName
    }
}



