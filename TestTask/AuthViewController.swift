//
//  AuthViewController.swift
//  TestTask
//
//  Created by Sergey Vorobey on 27/05/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let userDataAuth = UserAuth()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        userNameTextField.text = userDataAuth.username
        passwordTextField.text = userDataAuth.password
        
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {

        checkUser(username: userNameTextField.text!,
                  password: passwordTextField.text!)
    }
    
    private func checkUser(username: String, password: String) {
        
        if username == userDataAuth.username && password == userDataAuth.password {
            performSegue(withIdentifier: "showUserData", sender: nil)
        } else {
            self.showAlert(title: "Ошибка", message: "Ошибка данных")
        }
    }
}

extension AuthViewController {
   func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Закрыть", style: .default)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
