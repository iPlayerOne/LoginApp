//
//  MainViewController.swift
//  LoginApp
//
//  Created by ikorobov on 02.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!
    
    private let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        welcomeLabel.text = "Welcome, \(username ?? "default user")!"
    }
    
    
    @IBAction func logoutButton() {
        dismiss(animated: true)
    }
    
    private func setupBackground() {
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemOrange.cgColor
        ]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


