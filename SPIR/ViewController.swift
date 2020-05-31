//
//  ViewController.swift
//  SPIR
//
//  Created by Egor on 30.05.2020.
//  Copyright © 2020 TASS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private(set) lazy var loginLable: UILabel = {
        let view = UILabel()
        view.text = "Терминал"
        view.font = UIFont.boldSystemFont(ofSize:60)
        view.textColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()
    
    private(set) lazy var loginContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        self.view.addSubview(view)
        return view
    }()
    
    private(set) lazy var userNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "ID пользователя или электронная почта"
        view.borderStyle = .roundedRect
        view.translatesAutoresizingMaskIntoConstraints = false
        self.loginContentView.addSubview(view)
        return view
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
         let view = UITextField()
         view.backgroundColor = .white
         view.placeholder = "Пароль"
         view.borderStyle = .roundedRect
         view.translatesAutoresizingMaskIntoConstraints = false
         self.loginContentView.addSubview(view)
         return view
    }()
    
    private(set) lazy var btnLogin: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .blue
        view.setTitle("ВОЙТИ", for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        self.loginContentView.addSubview(view)
        return view
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.view.backgroundColor = .white
        
        self.buildContent()
    }

}
