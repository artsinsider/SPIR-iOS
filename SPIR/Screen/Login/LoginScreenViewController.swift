//
//  SPIR
//

import Quickly

class LoginScreenViewController : QNibViewController, IQContextable, IQRouterable {
    
    var context: ILoginScreenContext
    var router: ILoginScreenRouter
    
    @IBOutlet private var _usernameField: UITextField!
    @IBOutlet private var _passwordField: UITextField!
    @IBOutlet private var _loginButton: UIButton!
    
    init(context: ILoginScreenContext, router: ILoginScreenRouter) {
        self.context = context
        self.router = router
        
        super.init()
        
        self.context.loginManager.add(observer: self, priority: .ui)
    }
    
    deinit {
        self.context.loginManager.remove(observer: self)
    }
    
    @IBAction func pressed(loginButton: UIButton) {
        self.context.loginManager.perform(
            username: self._usernameField.text!,
            password: self._passwordField.text!
        )
    }
    
}

extension LoginScreenViewController : ILoginManagerObserver {
    
    func didFinish(_ manager: ILoginManager, user: IUser) {
        self.router.success(self, user: user)
    }
    
    func didFinish(_ manager: ILoginManager, error: ApiError) {
        print("error: \(error)")
    }
    
}
