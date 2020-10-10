//
//  HttpClient.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import Foundation
import Alamofire

class HttpClient {
    
    static let shared = HttpClient()
    
    private init() {}
    
    func getImages(page: Int, completion:@escaping (Result<[ImagesModel], NetWorkError>)->Void) {

        AF.request(HttpRouter.images(page: page)).responseJSON { response in

            guard let data = response.data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let imagesArray = try decoder.decode([ImagesModel].self, from: data)
                completion(.success(imagesArray))

            } catch let error {
                print(error)
                return completion(.failure(.decodingError("Error Decoding JSON")))
            }
        }
    }

}
