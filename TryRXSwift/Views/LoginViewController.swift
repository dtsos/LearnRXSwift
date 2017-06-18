//
//  LoginViewController.swift
//  TryRXSwift
//
//  Created by David Trivian S on 5/30/17.
//  Copyright © 2017 David Trivian S. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var texfieldUsername: UITextField!
    
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    var viewModel = LoginViewModel()
    
    let disposeBag = DisposeBag()

//    init(viewModel: LoginViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.viewModel = viewModel
        
        viewModel.username.asObservable().bind(to: texfieldUsername.rx.text).addDisposableTo(disposeBag)
        viewModel.password.asObservable().bind(to: textfieldPassword.rx.text).addDisposableTo(disposeBag)
        
        viewModel.isValid.bind(to: buttonLogin.rx.isEnabled).addDisposableTo(disposeBag)
        
        viewModel.isValid.drive
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
