//
//  LoginViewController.swift
//  Messaging-Sampler
//
//  Created by ShinokiRyosei on 2016/09/01.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        passwordTextField.secureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectLogin() {
        guard let email: String = emailTextField.text else { return }
        guard let password: String = passwordTextField.text else { return }
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                
            }
        })
    }
    
    func toHomeViewTransition() {
        
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}