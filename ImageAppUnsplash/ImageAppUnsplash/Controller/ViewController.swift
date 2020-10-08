//
//  ViewController.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 06/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let imageVM = ImageViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let objVC = story.instantiateViewController(withIdentifier: "ImageVC") as! ImageMainViewPager
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  imageVM.getImages()
        setUp()
    }
    
    func setUp() {
        userNameTextField.becomeFirstResponder()
        userNameTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.userNameSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordSubject).disposed(by: disposeBag)
        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map { $0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }


}

