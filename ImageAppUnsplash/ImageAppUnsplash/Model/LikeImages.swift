//
//  LikeImages.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import Foundation

struct LikeImages: Decodable, Equatable {
    let imageUrl: String
    let userName: String
    let likes: Int
    
    init(imageUrl: String, userName: String, likes: Int) {
        self.imageUrl = imageUrl
        self.userName = userName
        self.likes = likes
    }
}
