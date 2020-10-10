//
//  SwipeVCViewController.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import UIKit
import Koloda
import Alamofire
import AlamofireImage
import Firebase
import RxSwift
import RxCocoa

class SwipeVCViewController: UIViewController {

    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var swipeCardView: KolodaView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    let viewModel = ImageViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeCardView.dataSource = self
        swipeCardView.delegate = self
        bindView()
        viewModel.getUnSplashImages(completion: {
            self.swipeCardView.reloadData()
        })
    
    }
    
    // Binding view using rxcocoa
    func bindView() {
        
        viewModel
            .loading
            .drive(activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        likeButton.rx.tap
            .bind {
                self.swipeCardView.swipe(SwipeResultDirection.right)
        }
        .disposed(by: disposeBag)

        skipButton.rx.tap
            .bind {
                self.swipeCardView.swipe(SwipeResultDirection.left)
        }
        .disposed(by: disposeBag)
    }


}

extension SwipeVCViewController: KolodaViewDelegate, KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.af.setImage(withURL: viewModel.imageUrl(for: index)!)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        if index == viewModel.image.count - 5 {
            viewModel.pageNumber += 1
            
            viewModel.getUnSplashImages(completion: {
                self.swipeCardView.reloadData()
            })
        }
        return view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return viewModel.image.count
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        
        if direction == .right || direction == .topRight || direction == .bottomRight {

            viewModel.likePhoto(index: index)
        }
    }
}
