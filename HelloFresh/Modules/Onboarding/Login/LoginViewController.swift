//
//  LoginViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet weak var loginButton: RoundedButton!
    @IBOutlet weak var emailTextField: OnboardingTextField!
    @IBOutlet weak var passwordTextField: OnboardingTextField!

    // MARK: - Public properties -

    var presenter: LoginPresenterInterface!
    let validator = Validator()
    private var _isCustomAlertVisible: Bool = false
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _configure()
        
        presenter.viewDidLoad()
    }
	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
        
    // MARK: - Private Methods -
    
    private func _configure() {
        loginButton.backgroundColor = UIColor.hfGreen
        loginButton.setTitleColor(UIColor.white, for: .normal)
        
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        
        validator.registerField(emailTextField, errorTextField: emailTextField, rules: [RequiredRule(message: "Email is required for login")])
        validator.registerField(passwordTextField, errorTextField: passwordTextField, rules: [RequiredRule(message: "Password is required for login")])
    }
    
    fileprivate func _showTopAlertWithMessage(_ message: String) {
        if _isCustomAlertVisible {
            return
        }
        _isCustomAlertVisible = true
        
        displayTopAlertViewWith(message: message,
                                completion: {
                                    self._isCustomAlertVisible = false
        }
        )
    }
    
    // MARK: - Actions -
    
    @IBAction func loginUserButtonHandler(_ sender: UIButton) {
        validator.validate(self)
    }
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    
    func showLoginResultWith(message: String) {
        _showTopAlertWithMessage(message)
    }
}

extension LoginViewController: ValidationDelegate {
    
    func validationFailed(_ errors: [UITextField: ValidationError]) {
        var errorMessage = ""
        for (field, error) in validator.errors {
            errorMessage += error.errorMessage + "\n"
            UIView.animate(withDuration: 0.3,
                           animations: {
                            field.backgroundColor = UIColor.hfMango
            })
        }
        errorMessage = errorMessage.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        _showTopAlertWithMessage(errorMessage)
    }
    
    func validationSuccessful() {
        view.endEditing(true)
        presenter.loginUserActionHandlerWith(username: emailTextField.text!, password: passwordTextField.text!)
    }
}
