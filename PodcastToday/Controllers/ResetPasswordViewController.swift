//
//  ResetPasswordViewController.swift
//  PodcastToday
//
//  Created by YANA on 08/06/2022.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   
    @IBAction func didTapResetPassword(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {return}
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil{
                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)
            } else {
                let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                resetEmailSentAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                    self.dismiss(animated: true)
                }))
                self.present(resetEmailSentAlert, animated: true, completion: nil)
                
            }
        }
    }
    
}
