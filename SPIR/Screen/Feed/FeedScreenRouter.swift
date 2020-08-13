//
//  SPIR
//

import Quickly

class FeedScreenRouter : IFeedScreenRouter {
    
    private weak var _router: IFeedScreenRouter?
    
    init(router: IFeedScreenRouter) {
        self._router = router
    }
    
    func detail(_ viewController: FeedScreenViewController, feed: IFeed) {
        self._router?.detail(viewController, feed: feed)
    }
    
}
