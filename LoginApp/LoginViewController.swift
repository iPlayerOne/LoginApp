//
//  LoginViewController.swift
//  LoginApp
//
//  Created by ikorobov on 02.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var usernameHintButton: UIButton!
    @IBOutlet var passwordHintButton: UIButton!
    
    private let username = "qwerty"
    private let password = "qwerty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginButtonPressed() {
        fieldCheck()
        loginCheck()
    }
    
    @IBAction func usernameHint() {
        alertNotification(title: "Fine!", body: "Your username is qwerty" )
    }
    
    @IBAction func passwordHint() {
        alertNotification(title: "Creativity time!", body: "Your password is also qwerty. Seems unsafety :(")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func loginCheck() {
        guard userTextField.text == username &&
                passwordTextField.text == password else {
            alertNotification(title: "Oh!", body: "Something wrong with your password or username, or whatever. Try something else")
            return
        }
    }
    
    private func fieldCheck() {
        guard let userTF = userTextField.text,
              let passTF = passwordTextField.text,
              !userTF.isEmpty && !passTF.isEmpty  else {
            alertNotification(title: "Oops!", body: "Too empty to continiue")
            return
        }
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = userTextField.text
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.source is WelcomeViewController else { return }
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
}
    

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

