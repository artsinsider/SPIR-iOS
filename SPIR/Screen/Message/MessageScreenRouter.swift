//
//  SPIR
//

import Quickly

class MessageScreenRouter : IMessageScreenRouter {
    
    private weak var _router: IMessageScreenRouter?
    
    init(router: IMessageScreenRouter) {
        self._router = router
    }
    
    func close(_ viewController: MessageScreenViewController) {
        self._router?.close(viewController)
    }
    
}
