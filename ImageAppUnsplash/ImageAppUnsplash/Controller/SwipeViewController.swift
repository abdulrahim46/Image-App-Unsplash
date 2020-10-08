//
//  SwipeViewController.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 08/10/20.
//

import UIKit
import TinderSwipeView

let names = ["Adam Gontier","Matt Walst","Brad Walst","Neil Sanderson","Barry Stock","Nicky Patson"]


class SwipeViewController:UIViewController, TinderSwipeViewDelegate {
    
    private var swipeView: TinderSwipeView<UserModel>!{
        didSet{
            self.swipeView.delegate = self
        }
    }
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewNavigation: UIView!{
        didSet {
            self.viewNavigation.alpha = 0.0
        }
    }
    
    let userModels : [UserModel] =  {
        var model : [UserModel] = []
        for n in 1...10 {
            model.append(UserModel(name: names[Int(arc4random_uniform(UInt32(names.count)))], num: "\(n)"))
        }
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dynamically create view for each tinder card
        let contentView: (Int, CGRect, UserModel) -> (UIView) = { (index: Int ,frame: CGRect , userModel: UserModel) -> (UIView) in
            
            // Programitcally creating content view
//            if index % 2 != 0 {
//                return self.programticViewForOverlay(frame: frame, userModel: userModel)
//            }
            // loading contentview from nib
//            else{
                let customView = CustomView(frame: frame)
                customView.userModel = userModel
                customView.buttonAction.addTarget(self, action: #selector(self.customViewButtonSelected), for: UIControl.Event.touchUpInside)
                return customView
            //}
        }

        
        swipeView = TinderSwipeView<UserModel>(frame: viewContainer.bounds, contentView: contentView)
        viewContainer.addSubview(swipeView)
        swipeView.showTinderCards(with: userModels ,isDummyShow: true)
    }

    
    private func programticViewForOverlay(frame:CGRect, userModel:UserModel) -> UIView{
    
        let containerView = UIView(frame: frame)
        
        let backGroundImageView = UIImageView(frame:containerView.bounds)
        backGroundImageView.image = UIImage(named:String(Int(1 + arc4random() % (8 - 1))))
        backGroundImageView.contentMode = .scaleAspectFill
        backGroundImageView.clipsToBounds = true;
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
    
    private func attributeStringForModel(userModel:UserModel) -> NSAttributedString{
        
        let attributedText = NSMutableAttributedString(string: userModel.name, attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
        attributedText.append(NSAttributedString(string: "\nnums :\( userModel.num!) (programitically)", attributes: [.foregroundColor: UIColor.white,.font:UIFont.systemFont(ofSize: 18)]))
        return attributedText
    }
    
    @IBAction func leftSwipeAction(_ sender: Any) {
        if let swipeView = swipeView{
            swipeView.makeLeftSwipeAction()
        }
    }
    
    @IBAction func rightSwipeAction(_ sender: Any) {
        if let swipeView = swipeView{
            swipeView.makeRightSwipeAction()
        }
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        if let swipeView = swipeView{
            swipeView.undoCurrentTinderCard()
        }
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
