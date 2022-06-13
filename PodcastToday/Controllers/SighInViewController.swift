//
//  SighInViewController.swift
//  PodcastToday
//
//  Created by YANA on 06/06/2022.
//

import UIKit

class SighInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapForgotPassword(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func didTapLogInButton(_ sender: UIButton) {
        passwordTextField.resignFirstResponder() // to stop field for waiting for text
        usernameTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameTextField.text, !usernameEmail.isEmpty, let password = passwordTextField.text, !password.isEmpty, password.count >= 8
        else {
            print(passwordTextField)
            return
        }
        //login functionality
        var username:String?
        var email:String?
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            //login in using email
            email = usernameEmail
        } else{
            //login using username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUsed(username: username, email: email, password: password){ success in
            DispatchQueue.main.async { //queue of implementation .main
                if success{
                    //user log in
                    self.dismiss(animated: true, completion: nil)
                } else{
                   // error
                    let alert = UIAlertController(title: "Log in error", message: "We were unable to log you in.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                }
            }
            
        }
        
    }
    
}
