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
    
    private func handleNotAuthenticated(){
        //chek user status
        if Auth.auth().currentUser == nil {
            //show login
            let introVc = IntroViewController()
            introVc.modalPresentationStyle = .fullScreen
            present(introVc,animated: false)
        }
    }

}
