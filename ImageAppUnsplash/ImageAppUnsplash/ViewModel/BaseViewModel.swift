//
//  BaseViewModel.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import Foundation
import Firebase
import FirebaseFirestore

class BaseViewModel {
    let dbCollection = Firestore.firestore().collection(Constant.FireStore.Collections.likedPhotos)
}
