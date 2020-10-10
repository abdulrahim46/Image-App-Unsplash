//
//  ImagesModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import Foundation

import Foundation

// Declaring properties as optional here as Unsplash API sometimes may not return all values in every
// object or return null which leads a codable limitation.

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
    
    // MARK: - Equatable Protocol
    
    static func ==(lhs: ImagesModel, rhs: ImagesModel) -> Bool {
        
        if lhs.id == rhs.id {
            return true
        }
        return false
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



