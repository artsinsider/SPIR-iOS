//
//  SPIR
//

import Quickly

class MessageWireframe< RouterType: IQWireframeDefaultRouter, ContextType: IUserContext > : QStackWireframe< RouterType, ContextType > {

    override func setup() {
        self.viewController.viewControllers = [
            QStackViewController(
                viewController: MessageScreenViewController(
                    context: MessageScreenContext(
                        apiProvider: self.context.apiProvider,
                        message: self.context.message
                    ),
                    router: FeedScreenRouter(
                        router: self
                    )
                )
            )
        ]
    }

}

extension FeedWireframe : IMessageScreenRouter {
  
    
    func detail(_ viewController: MessageScreenViewController,message: IMessage) {
    }
    
}
