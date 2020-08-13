//
//  SPIR
//

import Quickly

protocol IFeedScreenContext : IQContext {
    
    var feedManager: IFeedManager { get }
    
}

protocol IFeedScreenRouter : IQRouter {
    
    func detail(_ viewController: FeedScreenViewController, feed: IFeed)
    
}
