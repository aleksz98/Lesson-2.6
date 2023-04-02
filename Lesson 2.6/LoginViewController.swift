//
//  ViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 02.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - Private constans
    private let userName = "Login"
    private let password = "123"
    
    // MARK: - Private ITextField
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    // MARK: - Private @IBAction
    @IBAction func logInButton(_ sender: Any) {
        checkLoginAndPassword()
    }
    @IBAction func forgotNameButton(_ sender: Any) {
        showInformationAlert(message: "Your name is \(userName) 😉")
        checkLoginAndPassword()
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
        showInformationAlert(message: "Your password is \(password) 😉")
    }
}

// MARK: - private extension LoginViewController
extension LoginViewController {
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func showInformationAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func checkLoginAndPassword() {
        if userNameTextField.text == userName && passwordTextField.text == password {
            performSegue(withIdentifier: "WelcomeViewController", sender: self)
        } else {
            let clearPasswordHandler = ClearPasswordTextField()
            let alert = UIAlertController(
                title: "Invalid login or password",
                message: "Pleae, enter correct login and password",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: clearPasswordHandler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func ClearPasswordTextField() -> ((UIAlertAction) -> Void)? {
        return { _ in
            self.passwordTextField.text?.removeAll()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WelcomeViewController" {
            if let destinationVC = segue.destination as? WelcomeViewController {
                destinationVC.userName = userNameTextField.text!
                destinationVC.password = passwordTextField.text!
            }
        }
    }
}
