//
// Copyright (c) 2020, Palmu Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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

