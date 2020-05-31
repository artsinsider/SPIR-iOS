//
//  ViewController.swift
//  SPIR
//
//  Created by Egor on 30.05.2020.
//  Copyright © 2020 TASS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var loginButton: UIButton!
    
    private let loginContentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userNameTextField:UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "ID пользователя или электронная почта"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    private let passwordTextField:UITextField = {
         let passField = UITextField()
         passField.backgroundColor = .white
         passField.placeholder = "Пароль"
         passField.borderStyle = .roundedRect
         passField.translatesAutoresizingMaskIntoConstraints = false
         return passField
     }()
    
    private let btnLogin:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .blue
        btn.setTitle("ВОЙТИ", for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private let loginLable:UILabel = {
        let logLable = UILabel()
        logLable.text = "Терминал"
        logLable.font = UIFont.boldSystemFont(ofSize:60)
        logLable.textColor = .blue
        logLable.translatesAutoresizingMaskIntoConstraints = false
        
        return logLable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(loginLable)
        
        loginContentView.addSubview(userNameTextField)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(btnLogin)
        
        view.addSubview(loginContentView)
        
        // Ограничения для лейбла
        loginLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        loginLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Ограничения для родительской обертки
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Ограничения для поля userNameTextField
        userNameTextField.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 40).isActive = true
        userNameTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 40).isActive = true
        userNameTextField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -40).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Ограничения для поля passwordTextField
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 40).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Ограничения для кнопки btnLogin
        btnLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        btnLogin.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 40).isActive = true
        btnLogin.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -40).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}
