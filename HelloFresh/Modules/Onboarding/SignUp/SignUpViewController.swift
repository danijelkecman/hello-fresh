//
//  SignUpViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: OnboardingTextField!
    @IBOutlet weak var emailTextField: OnboardingTextField!
    @IBOutlet weak var passwordTextField: OnboardingTextField!
    @IBOutlet weak var signupButton: RoundedButton!
    // MARK: - Public properties -

    var presenter: SignUpPresenterInterface!
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
    
    // MARK: - Private methods -
    
    private func _configure() {
        signupButton.backgroundColor = UIColor.hfGreen
        signupButton.setTitleColor(UIColor.white, for: .normal)
        
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        
        validator.registerField(nameTextField, errorTextField: nameTextField, rules: [RequiredRule(message: "Name field is required")])
        validator.registerField(emailTextField, errorTextField: emailTextField, rules: [EmailRule()])
        validator.registerField(passwordTextField, errorTextField: passwordTextField, rules: [PasswordRule()])
    }
    
    fileprivate func _showTopAlertWithMessage(_ message: String) {
        if _isCustomAlertVisible {
            return
        }
        _isCustomAlertVisible = true
        
        displayTopAlertViewWith(message: message,
                                completion: {
                                    self._isCustomAlertVisible = false
        })
    }
    
    // MARK: - Actions -
    
    @IBAction func signupUserButtonHandler(_ sender: UIButton) {
        nameTextField.backgroundColor = .white
        emailTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
        validator.validate(self)
    }
	
}

// MARK: - Extensions -

extension SignUpViewController: SignUpViewInterface {
}

extension SignUpViewController: ValidationDelegate {
    
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
        presenter.navigateToMainScreen()
    }
}
