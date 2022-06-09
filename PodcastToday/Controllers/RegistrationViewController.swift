//
//  ViewController.swift
//  PodcastToday
//
//  Created by YANA on 06/06/2022.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapRegisterUser(_ sender: UIButton) {
        passwordTextField.resignFirstResponder()
        userNameTextfield.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        // checking the registration form
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count>=8,
              let username = userNameTextfield.text, !username.isEmpty && passwordTextField.text == repeatPasswordTextField.text else{
            let ac = UIAlertController(title: "Error", message: "Password should contain atleast 8 characters", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(ac, animated: true)
            return
        }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password){
            registered in
            DispatchQueue.main.async {
                if registered {
                    //procceed
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    nextViewController.modalPresentationStyle = .fullScreen
                    self.present(nextViewController, animated:true, completion:nil)
                } else {
                    //failed
                    let ac = UIAlertController(title: "Error", message: "Can't register a new user", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
                    self.present(ac, animated: true)
                }
            }
        }
        
    }
}

