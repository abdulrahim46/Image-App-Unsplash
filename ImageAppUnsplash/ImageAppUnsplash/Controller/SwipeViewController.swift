//
//  SwipeViewController.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 08/10/20.
//

import UIKit
import RxSwift
import RxCocoa
import TinderSwipeView

let names = ["Adam Gontier","Matt Walst","Brad Walst","Neil Sanderson","Barry Stock","Nicky Patson"]


class SwipeViewController:UIViewController, TinderSwipeViewDelegate {
    
    private var swipeView: TinderSwipeView<ImagesModel>!{
        didSet{
            self.swipeView.delegate = self
        }
    }
    
    let disposeBag = DisposeBag()
    private var imageService = ResponData()
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewNavigation: UIView!{
        didSet {
            self.viewNavigation.alpha = 1
        }
    }
    
    var images = [ImagesModel]()
    let userModels : [UserModel] =  {
        var model : [UserModel] = []
        for n in 1...10 {
            model.append(UserModel(name: names[Int(arc4random_uniform(UInt32(names.count)))], num: "\(n)"))
        }
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subscription = imageService.getImages().subscribe(onNext: { (value) in
            print(value)
            self.images.append(contentsOf: value)
            print(self.images.count)
            self.setView(data: self.images)
        }, onError: { (error) in
            print("error: \(error)")
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
        subscription.disposed(by: disposeBag)
    }
    
    
    func setView(data: [ImagesModel]) {
        
        // Dynamically create view for each tinder card
        let contentView: (Int, CGRect, ImagesModel) -> (UIView) = { (index: Int ,frame: CGRect , userModel: ImagesModel) -> (UIView) in
//                        if index % 2 != 0 {
//                            return self.programticViewForOverlay(frame: frame, userModel: userModel)
//                        } else {
//                                        let customView = CustomView(frame: frame)
//                                        customView.userModel = userModel
//                                        customView.buttonAction.addTarget(self, action: #selector(self.customViewButtonSelected), for: UIControl.Event.touchUpInside)
//                                        return customView
//                        }
            return self.programticViewForOverlay(frame: frame, userModel: userModel)


        }
        swipeView = TinderSwipeView<ImagesModel>(frame: viewContainer.bounds, contentView: contentView)
        viewContainer.addSubview(swipeView)
        swipeView.showTinderCards(with: data ,isDummyShow: true)
    }
    
    private func programticViewForOverlay(frame:CGRect, userModel:ImagesModel) -> UIView{

        let containerView = UIView(frame: frame)

        let backGroundImageView = UIImageView(frame:containerView.bounds)
        backGroundImageView.load(url: userModel.regular!)
        //backGroundImageView.image = UIImage(named:String(Int(1 + arc4random() % (8 - 1))))
        backGroundImageView.contentMode = .scaleAspectFill
        backGroundImageView.clipsToBounds = true
        containerView.addSubview(backGroundImageView)

        let profileImageView = UIImageView(frame:CGRect(x: 25, y: frame.size.height - 80, width: 60, height: 60))
        profileImageView.image =  #imageLiteral(resourceName: "profileimage")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        containerView.addSubview(profileImageView)

        let labelText = UILabel(frame:CGRect(x: 90, y: frame.size.height - 80, width: frame.size.width - 100, height: 60))
        labelText.attributedText = self.attributeStringForModel(userModel: userModel)
        labelText.numberOfLines = 2
        containerView.addSubview(labelText)

        return containerView
    }

    private func attributeStringForModel(userModel:ImagesModel) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: userModel.id ?? "NIL", attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
        attributedText.append(NSAttributedString(string: "\nnums :\( userModel.id ?? "NIL")", attributes: [.foregroundColor: UIColor.white,.font:UIFont.systemFont(ofSize: 18)]))
        
        return attributedText
    }
    
    @IBAction func leftSwipeAction(_ sender: Any) {
        if let swipeView = swipeView {
            swipeView.makeLeftSwipeAction()
        }
    }
    
    @IBAction func rightSwipeAction(_ sender: Any) {
        if let swipeView = swipeView {
            swipeView.makeRightSwipeAction()
        }
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        //        if let swipeView = swipeView{
        //            swipeView.undoCurrentTinderCard()
        //        }
    }
    
    func dummyAnimationDone() {
        
    }
    
    func currentCardStatus(card: Any, distance: CGFloat) {
        
    }
    
    func fallbackCard(model: Any) {
        
    }
    
    func didSelectCard(model: Any) {
        
    }
    
    func cardGoesLeft(model: Any) {
        
    }
    
    func cardGoesRight(model: Any) {
        
    }
    
    func undoCardsDone(model: Any) {
        
    }
    
    func endOfCardsReached() {
        
    }
    
    @objc func customViewButtonSelected(button:UIButton){
        
        //        if let customView = button.superview(of: CustomView.self) , let userModel = customView.userModel{
        //            print("button selected for \(userModel.name!)")
        //        }
        
    }
}

class ResponData {
    private let service = ImageService()
    func getImages() -> Observable<[ImagesModel]> {
        return service.fetchImages()
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
