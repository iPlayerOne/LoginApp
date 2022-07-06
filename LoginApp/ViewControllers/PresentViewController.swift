//
//  PresentViewController.swift
//  LoginApp
//
//  Created by ikorobov on 06.07.2022.
//

import UIKit

class PresentViewController: UIViewController {
    
    @IBOutlet var presentPresentation: UILabel!
    
    @IBOutlet var presentImage: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground(colorOne: UIColor.systemCyan.cgColor, colorTwo: UIColor.systemBlue.cgColor)
        presentImage.image = UIImage(named: user.about.images[2])
        presentPresentation.text = user.about.present
    }
    
    override func viewDidLayoutSubviews() {
        presentImage.layer.cornerRadius = presentImage.frame.height / 2
        presentImage.layer.borderWidth = 5
        presentImage.layer.borderColor = UIColor.lightGray.cgColor
    }
}
