//
//  ImageViewModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import UIKit
import Alamofire

class ImageViewModel {
    

    var arrayImages = [ImagesModel]()
    
    func getImages() {
        AF.request("https://api.unsplash.com/photos/?client_id=QCauL1KMtXbjCdNib8iIoGxKWgHJsfWmqU4pQlKTly8").response { response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode([ImagesModel].self, from: data)
                    print(response)
                    self.arrayImages.append(contentsOf: response)
                    DispatchQueue.main.async{
                    //    self.vc?.tblView.reloadData()
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
    
}
