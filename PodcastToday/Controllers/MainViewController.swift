//
//  MainViewController.swift
//  PodcastToday
//
//  Created by YANA on 07/06/2022.
//

import UIKit
import Firebase

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated(){
        //chek user status
        if Auth.auth().currentUser == nil {
            //show login
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let viewController = storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: false) {
                print("Presented")
            }
            
        }
    
}
}
