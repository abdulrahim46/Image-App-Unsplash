//
//  ImagesModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import Foundation

struct ImagesModel: Decodable {
    
    var id: String = "MIKe"
    var regular: String = "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MjMwN30"
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case urls = "urls"
    }
    enum Urls: String, CodingKey {
        case regular
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? " jansdkj "
        let nameContainer = try values.nestedContainer(keyedBy: Urls.self, forKey: .urls)
        self.regular = try nameContainer.decode(String.self, forKey: .regular)
    }
    
}
//
//"urls": {
//            "raw": "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE3MjMwN30",
//            "full": "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE3MjMwN30",
//            "regular": "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3MjMwN30",
//            "small": "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE3MjMwN30",
//            "thumb": "https://images.unsplash.com/photo-1601758124277-f0086d5ab050?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3MjMwN30"
//        }



