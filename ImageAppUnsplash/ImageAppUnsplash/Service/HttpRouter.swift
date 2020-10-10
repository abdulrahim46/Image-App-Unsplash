//
//  HttpRouter.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import Foundation
import Alamofire

enum HttpRouter: URLRequestConvertible {
    
    case images(page: Int)
    
    private var method: HTTPMethod {
        
        switch self {
        
        case .images:
            return .get
        }
    }
    
    private var path: String {
        
        switch self {
            
        case .images(let page):
            return "photos" + "?page=\(page)"
        }
    }
    
    private var bodyParameters: Parameters? {
        
        switch self {
            
        case .images:
            return nil
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let urlString = try? Constant.Unsplash.baseURL.asURL()
            .appendingPathComponent(path)
            .absoluteString.removingPercentEncoding
        let url = URL(string: urlString ?? "")
        var urlRequest = URLRequest(url: url!)
        
        // HTTP Method
        
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("Client-ID \(Constant.Unsplash.accessKey)", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        
        if let parameters = bodyParameters {
            
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
    
}
