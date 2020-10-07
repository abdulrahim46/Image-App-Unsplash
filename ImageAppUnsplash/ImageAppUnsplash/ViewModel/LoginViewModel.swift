//
//  LoginViewModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 07/10/20.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let userNameSubject = PublishSubject<String>()
    let passwordSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(userNameSubject.asObserver().startWith(""),passwordSubject.asObserver().startWith("")).map { username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
