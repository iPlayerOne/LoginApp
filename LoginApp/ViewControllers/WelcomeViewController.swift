//
//  MainViewController.swift
//  LoginApp
//
//  Created by ikorobov on 02.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var presentation: UILabel!
    @IBOutlet var clause: UILabel!
    @IBOutlet var age: UILabel!
    
    @IBOutlet var userImage: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground(colorOne: UIColor.systemYellow.cgColor, colorTwo: UIColor.systemOrange.cgColor)
        userImage.image = UIImage(named: user.about.images[0])
        welcomeLabel.text = "Welcome, \(user.about.name) \(user.about.surname)!"
        age.text = "\(user.about.age) года"
        presentation.text = user.about.future
        clause.text = user.about.sadButTrue
    }
    
    override func viewDidLayoutSubviews() {
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 5
        userImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}




