//
//  LikeViewController.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import UIKit
import RxSwift

class LikeViewController: UIViewController {

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! 
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = LikeImagesViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getLikedPhotos()
    }
    
    func bindView() {
        
        collectionView.register(UINib(nibName:"LikeImagesCell", bundle: nil), forCellWithReuseIdentifier: "LikeImagesCellIdentifier")
        
        // View binding
        viewModel
            .loading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel
            .images
            .drive(collectionView.rx.items(cellIdentifier: "LikeImagesCellIdentifier", cellType: LikeImagesCell.self)) { (row,image,cell) in
                cell.configureCell(images: image)
            }.disposed(by: disposeBag)
    }

}

extension LikeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
