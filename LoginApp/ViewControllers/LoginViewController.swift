//
//  LoginViewController.swift
//  LoginApp
//
//  Created by ikorobov on 02.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
   
    // MARK: - IB Outlets
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Propirties
    
    let user = User.getUser()
    
    
    // MARK: - Override Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let pastVC = navigationVC.topViewController as? PastViewController else { return }
                pastVC.user = user
            }
        }
    
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func loginButtonPressed() {
        guard userTextField.text == user.username,
              passwordTextField.text == user.password else {
            alertNotification(
                title: "Oh!",
                body: "Something wrong with your password or username, or whatever. Try something else"
            )
            return
        }
        performSegue(withIdentifier:"toWelcomeVC", sender: nil)
    }
    
    @IBAction func loginDataHint(_ sender: UIButton) {
        sender.tag == 0
        ? alertNotification(
            title: "Fine!",
            body: "Your username is \(user.username)"
        )
        : alertNotification(
            title: "Creativity time!",
            body: "Your password is also \(user.password). Seems unsafety :("
        )
        
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private Methods
        
}
    
    // MARK: - Extentions

extension LoginViewController {
    private func alertNotification(title: String, body message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Thanks!", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension UIViewController {
    func setupBackground(colorOne: CGColor, colorTwo: CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorOne, colorTwo]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

