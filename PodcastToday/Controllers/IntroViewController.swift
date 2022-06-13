//
//  IntroViewController.swift
//  PodcastToday
//
//  Created by YANA on 06/06/2022.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapSignUP(_ sender: UIButton) {
       
        
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
       
        
    }
}

extension UINavigationController {

    var rootViewController: UIViewController? {
        return viewControllers.first
    }

}
