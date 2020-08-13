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
                        apiProvider: self.context.apiProvider
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
    }
    
}
