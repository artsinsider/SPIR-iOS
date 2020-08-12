//
//  ViewController.swift
//  SPIR
//
//  Created by Egor on 30.05.2020.
//  Copyright © 2020 TASS. All rights reserved.
//

import UIKit
import Quickly

class ViewController: UIViewController {
    
    private lazy var _provider = ApiProvider(
        url: URL(string: "https://terminal.tass.ru/api/v2")!
    )
    private lazy var _manager = ApiLoginManager(
        apiProvider: self._provider
    )
    
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
        
        self._manager.add(observer: self, priority: .ui)
        self._manager.perform(username: "u4@u.ru", password: "1@#QWe")
    }

}


extension ViewController : ILoginManagerObserver {
    
    func didFinish(_ manager: ILoginManager, user: IUser) {
        print("accessToken: \(user.accessToken)")
    }
    
    func didFinish(_ manager: ILoginManager, error: ApiError) {
        print("error: \(error)")
    }
    
}
