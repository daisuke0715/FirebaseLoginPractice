//
//  ViewController.swift
//  Practice_FirebaseLogin
//
//  Created by 河村大介 on 2021/03/29.
//

import UIKit
import Firebase
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {

    @IBOutlet weak var authButton: UIButton!
    
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()! }}
    
    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
        FUIEmailAuth()
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authUI.delegate = self
        self.authUI.providers = providers
        authButton.addTarget(self, action: #selector(self.authButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    @IBAction func authButtonTapped(_ sender: Any) {
        
        let authViewController = self.authUI.authViewController()
        
        self.present(authViewController, animated: true, completion: nil)
    }
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, url: URL?, error: Error?) {
        if error == nil {
            self.performSegue(withIdentifier: "toNextView", sender: nil)
            
        } else {
            print("error")
        }
    }
    
    
    


}

