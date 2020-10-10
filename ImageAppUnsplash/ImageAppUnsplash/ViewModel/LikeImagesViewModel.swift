//
//  LikeImagesViewModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import Foundation
import RxSwift
import RxCocoa

class LikeImagesViewModel: BaseViewModel {
    
    private let likedImages = BehaviorRelay<[LikeImages]>(value: [])
    private let isLoading = BehaviorRelay<Bool>(value: false)
    
    var images: Driver<[LikeImages]> {  //  - it delivers events on `MainScheduler.instance`
        return likedImages.asDriver()
    }
    
    var loading: Driver<Bool> {
        return isLoading.asDriver()
    }
    
    func getLikedPhotos() {
        
        isLoading.accept(true)
        
        // Getting all liked images from FireStore
        dbCollection.getDocuments { (snapShot,error) in
            
            guard let snap = snapShot else { return }
            
            self.isLoading.accept(false)
            
            if let error = error {
               // AlertBuilder.failureAlertWithMessage(message: error.localizedDescription)

            } else if let snapShot = snapShot {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                var photos = [LikeImages]()

                snapShot.documents.forEach { (document) in

                    if let photo = try? decoder.decode(LikeImages.self, fromJSONObject: document.data()) {
                        photos.append(photo)
                    }
                }
                self.likedImages.accept(photos)
            }
        }
    
    }
}

extension JSONDecoder {
    
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}

