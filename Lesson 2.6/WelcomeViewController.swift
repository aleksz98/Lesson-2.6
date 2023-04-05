//
//  WelcomeViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 02.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    // MARK: - Private constans
    var userName = ""
    var password = ""
    
    // MARK: - Private @IBOutlet
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)"
    }
}
