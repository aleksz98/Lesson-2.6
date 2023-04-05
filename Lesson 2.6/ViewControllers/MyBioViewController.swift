//
//  MyBioViewController.swift
//  Lesson 2.6
//
//  Created by Иван on 05.04.2023.
//

import UIKit

final class MyBioViewController: UIViewController {
    
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
    @IBOutlet private weak var myNameLabel: UILabel!
    @IBOutlet private weak var mySurnameLabel: UILabel!
    @IBOutlet private weak var myCompanyLabel: UILabel!
    @IBOutlet private weak var myDepartmentLabel: UILabel!
    @IBOutlet private weak var myPositionLabel: UILabel!
    @IBOutlet private weak var myImageView: UIImageView!
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setUpInfo()
    }
    @IBAction func bioButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showBio", sender: nil)
    }
}

// MARK: - private extension MyBioViewController
private extension MyBioViewController {
    private func setUpInfo() {
        myNameLabel.text = userInfo.myName
        mySurnameLabel.text = userInfo.mySurname
        myCompanyLabel.text = userInfo.myCompany
        myDepartmentLabel.text = userInfo.myDepartment
        myPositionLabel.text = userInfo.myPosition
        myImageView.layer.cornerRadius = myImageView.frame.size.width / 2
        myImageView.clipsToBounds = true
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
