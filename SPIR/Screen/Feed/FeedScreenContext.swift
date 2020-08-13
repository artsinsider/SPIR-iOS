//
//  SPIR
//

import Quickly

class FeedScreenContext : IFeedScreenContext {
    
    var feedManager: IFeedManager
    
    init(apiProvider: IApiProvider) {
        self.feedManager = LoadingFeedManager()
    }
    
}
