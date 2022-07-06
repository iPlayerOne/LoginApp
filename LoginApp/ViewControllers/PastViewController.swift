//
//  PastViewController.swift
//  LoginApp
//
//  Created by ikorobov on 06.07.2022.
//

import UIKit

class PastViewController: UIViewController {
    
    @IBOutlet var pastPresentation: UILabel!
    
    @IBOutlet var pastImage: UIImageView!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground(colorOne: UIColor.systemBlue.cgColor, colorTwo: UIColor.systemIndigo.cgColor)
        pastImage.image = UIImage(named: user.about.images[1])
        pastPresentation.text = user.about.past
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let presentVC = segue.destination as? PresentViewController else { return }
        presentVC.user = user
    }
    
    override func viewDidLayoutSubviews() {
        pastImage.layer.cornerRadius = pastImage.frame.height / 2
        pastImage.layer.borderWidth = 5
        pastImage.layer.borderColor = UIColor.lightGray.cgColor
    }
}
