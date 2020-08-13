//
//  SPIR
//

import Quickly

class FeedScreenContext : IFeedScreenContext {
    
    var feedManager: IFeedManager
    
    init(apiProvider: IApiProvider, user: IUser) {
        self.feedManager = ApiFeedManager(apiProvider: apiProvider, user: user)
    }
    
}
