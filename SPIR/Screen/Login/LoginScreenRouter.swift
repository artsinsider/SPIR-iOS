//
//  SPIR
//

import Quickly

class LoginScreenRouter : ILoginScreenRouter {
    
    private weak var _router: ILoginScreenRouter?
    
    init(router: ILoginScreenRouter) {
        self._router = router
    }
    
    func success(_ viewController: LoginScreenViewController) {
        self._router?.success(viewController)
    }
    
}
