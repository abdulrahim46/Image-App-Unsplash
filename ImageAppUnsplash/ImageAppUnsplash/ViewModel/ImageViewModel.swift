//
//  ImageViewModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class ImageViewModel:BaseViewModel {
    
    private var images = [ImagesModel]()
    private let isLoading = BehaviorRelay<Bool>(value: false)
    
    var pageNumber = 1
    
    var loading: Driver<Bool> {
        return isLoading.asDriver()
    }
    
    var image : [ImagesModel] {
        return images
    }
    
    
    // Mark:- API call to fetch Images
    
    func getUnSplashImages(completion: @escaping () -> Void) {
        
        if pageNumber == 1 {
            isLoading.accept(true)
        }
        
        HttpClient.shared.getImages(page: pageNumber) { result in
            self.isLoading.accept(false)
            print(result)
            DispatchQueue.main.async() { [weak self] in
                
                guard let self = self else { return }
                
                switch result {
                
                case .success(let images):
                    if self.pageNumber == 1 {
                        self.images = images
                        
                    } else {
                        self.images.append(contentsOf: images)
                    }
                    
                    completion()
                 
                case .failure(let error):
                    print(error.localizedDescription)
                
                }
                
            }
        }
    }
    
    // MArk:- API call to save like images
    func likePhoto(index: Int) {
        let imageUrl = images[index].urls?.regular
        let userName = images[index].user?.username
        let likes = images[index].likes

        let data = [
            "imageUrl": imageUrl ?? "",
            "userName": userName ?? "",
            "likes": likes ?? 0] as [String : Any]

        // Creating Document Reference

        let docRef = dbCollection.whereField("imageUrl", isEqualTo: imageUrl ?? "").limit(to: 1)
        
        docRef.getDocuments { (querysnapshot, error) in

            if error != nil {
                print(error?.localizedDescription)
            } else {

                if let doc = querysnapshot?.documents, !doc.isEmpty {
                    return
                } else {
                    
                    self.dbCollection.document().setData(data) { (error) in

                        if error != nil {
                            print(error?.localizedDescription ?? "Could not add image to Database")
                        }
                    }
                }
            }
        }
    }
    
    func imageUrl(for index: Int) -> URL? {

        let url = images[index].urls?.regular

        if let url = URL(string: url ?? "") {
            return url
        }
        return nil
    }
    
}
