//
//  ImageMainViewPager.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 07/10/20.
//

import Foundation
import DTPagerController

class ImageMainViewPager: DTPagerController {
    
    init() {
       super.init(viewControllers: [])
       title = "Palmu"
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       // fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        setUpTab()
    }
    
    func setUpTab() {
        self.pageScrollView.isScrollEnabled = false
        self.selectedTextColor = UIColor.magenta
        self.scrollIndicator.backgroundColor = UIColor.magenta
        self.selectedFont = UIFont.italicSystemFont(ofSize: 15)
        self.font = UIFont.italicSystemFont(ofSize: 12)
        self.textColor = UIColor.magenta
        self.view.backgroundColor = UIColor.white
        let story = UIStoryboard(name: "Main", bundle: nil)
        let objVC = story.instantiateViewController(withIdentifier: "swipeViewController") as? SwipeViewController
        let objLikeVC = story.instantiateViewController(withIdentifier: "viewController") as? ViewController
        objVC?.title = "Swipe"
        objLikeVC?.title = "Likes"
        viewControllers = [objVC, objLikeVC] as! [UIViewController]
    }
}
