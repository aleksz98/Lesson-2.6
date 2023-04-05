//
//  WelcomeViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 02.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
// MARK: - Private constans
    private let userInfo = userData.getUserData()[0]
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
// MARK: - Private @IBOutlet
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var myInfoLabel: UILabel!
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupWelcomeLabels()
    }
}

// Mark: - Setup WelcomeViewController
private extension WelcomeViewController {
    private func setupWelcomeLabels() {
        welcomeLabel.text = "Welcome, \(userInfo.login)"
        myInfoLabel.text = "My Name is \(userInfo.myName) \(userInfo.mySurname)"
    }
}

// MARK: - Set background color
private extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
