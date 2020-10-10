//
//  ImageMainViewPager.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 07/10/20.
//

import UIKit
import RxSwift
import RxCocoa


class ImageMainViewPager: UIViewController {
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    private var activeVC: UIViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    var swipeViewController = SwipeVCViewController()
    var likeViewController = LikeViewController()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeVC = swipeViewController
        subscribeViews()
        setupSegment()
        
    }
    
    // MARK: - RxSubscription
    
    func subscribeViews() {
        
        segmentView.rx.selectedSegmentIndex
            
            .subscribe (onNext: {[weak self] index in
                guard let self = self else { return }
                
                if index == 0 {
                    self.activeVC = self.swipeViewController
                    
                } else {
                    self.activeVC = self.likeViewController
                }
                
            }).disposed(by: disposeBag) 
    }
    
    
    private func setupSegment() {
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        
        if let inActiveViewController = inactiveViewController {
            inActiveViewController.willMove(toParent: nil)
            inActiveViewController.view.removeFromSuperview()
            inActiveViewController.removeFromParent()
        }
    }
    
    private func updateActiveViewController() {
        
        if let activeVC = activeVC {
            addChild(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParent: self)
        }
    }
}
