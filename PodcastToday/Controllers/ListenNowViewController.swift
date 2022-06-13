//
//  ListenNowViewController.swift
//  PodcastToday
//
//  Created by YANA on 13/06/2022.
//

import UIKit

class ListenNowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
    }
    
    private func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action:#selector(didTapSettingsButton))
    }
   
    @objc private func didTapSettingsButton(){
        //let vc = SettingsViewController()
        //vc.title = "Settings"
        //navigationController?.pushViewController(vc, animated: true)
        let actionSheet = UIAlertController(title: "Log out", message: "Are you sure you want to log out?", preferredStyle: .alert)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(completion: { success in
                DispatchQueue.main.async {
                    if success{
                        //present login screen
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let viewController = storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
                        viewController.modalPresentationStyle = .fullScreen
                        self.present(viewController, animated: true) {
                            print("Presented")
                        }
                    }
                    else{
                        //trows error
                        fatalError("Could not log out user")
                    }
                }
            })
            
        }))
        present(actionSheet, animated: true)
    }
    
}
