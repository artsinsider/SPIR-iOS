//
//  SPIR
//

import Quickly

protocol ILoginWireframeRouter : IQRouter {
    
    func didAuthorized(user: IUser)

}

class LoginWireframe< RouterType: IQWireframeDefaultRouter & ILoginWireframeRouter, ContextType: IAppContext > : QStackWireframe< RouterType, ContextType > {

    override func setup() {
        self.viewController.viewControllers = [
            QStackViewController(
                viewController: LoginScreenViewController(
                    context: LoginScreenContext(
                        apiProvider: self.context.apiProvider
                    ),
                    router: LoginScreenRouter(
                        router: self
                    )
                )
            )
        ]
    }

}

extension LoginWireframe : ILoginScreenRouter {
    
    func success(_ viewController: LoginScreenViewController, user: IUser) {
        self.router?.didAuthorized(user: user)
    }
    
}
