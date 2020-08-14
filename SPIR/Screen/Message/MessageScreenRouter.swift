//
//  SPIR
//

import Quickly

class MessageScreenRouter : IMessageScreenRouter {
    
    private weak var _router: IMessageScreenRouter?
    
    init(router: IMessageScreenRouter) {
        self._router = router
    }
    
    func success(_ viewController: MessageScreenViewController, message: IMessage) {
        self._router?.success(viewController, message: message)
    }
    
}
