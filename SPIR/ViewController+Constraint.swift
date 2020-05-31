//
//  ViewController+Constraint.swift
//  SPIR
//
//  Created by Alexander Trifonov on 31.05.2020.
//  Copyright © 2020 TASS. All rights reserved.
//

import UIKit

extension ViewController {
    
    func buildContent(keyboardHeight: CGFloat = 0) {
        self.view.removeConstraints(self.view.constraints)
        self.loginContentView.removeConstraints(self.loginContentView.constraints)
        
        if keyboardHeight > 0 {
            // Ограничения для лейбла
            self.loginLable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
            self.loginLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            // Ограничения для родительской обертки
            self.loginContentView.topAnchor.constraint(equalTo: self.loginLable.bottomAnchor, constant: 20).isActive = true
            self.loginContentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.loginContentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        } else {
            // Ограничения для лейбла
            self.loginLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.loginLable.bottomAnchor.constraint(equalTo: self.loginContentView.topAnchor, constant: -40).isActive = true
            
            // Ограничения для родительской обертки
            self.loginContentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.loginContentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.loginContentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }

        // Ограничения для поля userNameTextField
        self.userNameTextField.topAnchor.constraint(equalTo: self.loginContentView.topAnchor, constant: 40).isActive = true
        self.userNameTextField.leftAnchor.constraint(equalTo: self.loginContentView.leftAnchor, constant: 40).isActive = true
        self.userNameTextField.rightAnchor.constraint(equalTo: self.loginContentView.rightAnchor, constant: -40).isActive = true
        self.userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Ограничения для поля passwordTextField
        self.passwordTextField.topAnchor.constraint(equalTo: self.userNameTextField.bottomAnchor, constant: 20).isActive = true
        self.passwordTextField.leftAnchor.constraint(equalTo: self.loginContentView.leftAnchor, constant: 40).isActive = true
        self.passwordTextField.rightAnchor.constraint(equalTo: self.loginContentView.rightAnchor, constant: -40).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Ограничения для кнопки btnLogin
        self.btnLogin.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40).isActive = true
        self.btnLogin.leftAnchor.constraint(equalTo: self.loginContentView.leftAnchor, constant: 40).isActive = true
        self.btnLogin.rightAnchor.constraint(equalTo: self.loginContentView.rightAnchor, constant: -40).isActive = true
        self.btnLogin.bottomAnchor.constraint(equalTo: self.loginContentView.bottomAnchor, constant: -40).isActive = true
        self.btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
