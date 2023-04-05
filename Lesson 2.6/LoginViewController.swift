//
//  ViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 02.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - Private ITextField
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private constans
    private let userName = "Login"
    private let password = "123"
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destinationVC = segue.destination as? WelcomeViewController {
                destinationVC.userName = userNameTextField.text!
                destinationVC.password = passwordTextField.text!
        }
    }
    
    
    // MARK: - Private @IBAction
    @IBAction func logInButton(_ sender: UIButton) {
        checkLoginAndPassword()
    }
    @IBAction func forgotNameButton(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your name is \(userName) 😉")
    }
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

private extension LoginViewController {
    
    private func checkLoginAndPassword() {
        if userNameTextField.text == userName && passwordTextField.text == password {
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
