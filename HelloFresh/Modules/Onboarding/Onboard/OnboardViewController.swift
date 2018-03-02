//
//  OnboardViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/6/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class OnboardViewController: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet weak var loginButton: RoundedButton!
    @IBOutlet weak var signupButton: RoundedButton!
    

    // MARK: - Public properties -

    var presenter: OnboardPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _configure()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeBackText(from: self, backImageName: "icArrowBack", backImageColor: .black)
        setNavigationBarShadowVisible(false)
    }
    
    // MARK: - Private methods -
    
    private func _configure() {
        loginButton.backgroundColor = UIColor.hfGreen
        loginButton.setTitleColor(UIColor.white, for: .normal)
        
        signupButton.backgroundColor = UIColor.white
        signupButton.borderColor = UIColor.hfGreen
        signupButton.setTitleColor(UIColor.hfGreen, for: .normal)
    }
    
    // MARK: - Actions -
    
    @IBAction func loginUserButtonHandler(_ sender: UIButton) {
        presenter.didSelectLoginUserAction()
        
    }
    
    @IBAction func signupUserButtonHandlr(_ sender: UIButton) {
        presenter.didSelectSignupUserAction()
    }
	
}

// MARK: - Extensions -

extension OnboardViewController: OnboardViewInterface {
}
