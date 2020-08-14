//
//  SPIR
//

import Quickly

class FeedWireframe< RouterType: IQWireframeDefaultRouter, ContextType: IUserContext > : QStackWireframe< RouterType, ContextType > {

    override func setup() {
        self.viewController.viewControllers = [
            QStackViewController(
                viewController: FeedScreenViewController(
                    context: FeedScreenContext(
                        apiProvider: self.context.apiProvider,
                        user: self.context.user
                    ),
                    router: FeedScreenRouter(
                        router: self
                    )
                )
            )
        ]
    }

}

extension FeedWireframe : IFeedScreenRouter {
    
    func detail(_ viewController: FeedScreenViewController, feed: IFeed) {
        let vc = MessageScreenViewController(
            context: MessageScreenContext(
                apiProvider: self.context.apiProvider,
                user: self.context.user,
                materialId: feed.id,
                query: ""
            ),
            router: MessageScreenRouter(router: self)
        )
        self.push(viewController: vc, animated: true, completion: nil)
    }
    
}

extension FeedWireframe : IMessageScreenRouter {
  
    func close(_ viewController: MessageScreenViewController) {
        self.pop(viewController: viewController, animated: true, completion: nil)
    }
    
}
