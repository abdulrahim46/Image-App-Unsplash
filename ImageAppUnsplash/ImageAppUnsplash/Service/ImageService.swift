//
//  ImageService.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 09/10/20.
//
import Foundation
import Alamofire
import RxSwift

class ImageService {
    
    func fetchImages() -> Observable<[ImagesModel]> {
        
        return Observable.create { observer -> Disposable in
            AF.request("https://api.unsplash.com/photos/?client_id=QCauL1KMtXbjCdNib8iIoGxKWgHJsfWmqU4pQlKTly8").response { response in
                if let data = response.data {
                    do{
                        let response = try JSONDecoder().decode([ImagesModel].self, from: data)
                        observer.onNext(response)
                        //observer.onCompleted()
                        //print(response)
                    }catch let err{
                        observer.onError(err)
                        print(err.localizedDescription)
                    }
                }
            }
            
        return Disposables.create { }
        }
        
    }
    
}
