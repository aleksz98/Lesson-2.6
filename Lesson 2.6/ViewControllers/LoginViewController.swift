//
//  ViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 02.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
// MARK: - Private ITextField
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
// MARK: - Private constans
    private let userInfo = userData.getUserData()[0]
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        savedDataUser()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - Private @IBAction
    @IBAction private func logInButton(_ sender: UIButton) {
        checkLoginAndPassword()
    }
    @IBAction private func forgotNameButton(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your name is \(userInfo.myName) 😉")
    }
    @IBAction private func forgotPasswordButton(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your password is \(userInfo.password) 😉")
    }
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        
    }
}

// Mark: - Setup LoginViewController
private extension LoginViewController {
    
    private func savedDataUser() {
        userNameTextField.text = userInfo.login
        passwordTextField.text = userInfo.password
    }
    
    private func checkLoginAndPassword() {
        if userNameTextField.text == userInfo.login && passwordTextField.text == userInfo.password {
            performSegue(withIdentifier: "WelcomeViewController", sender: nil)
        } else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
