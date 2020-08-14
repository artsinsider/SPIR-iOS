//
//  SPIR
//

import Quickly

class ApiFeedManager : IFeedManager {
    
    var apiProvider: IApiProvider
    var user: IUser
    
    var isLoading: Bool {
        return self._apiQuery != nil
    }
    
    var isLoadedFirstPage: Bool
    var canLoadMore: Bool
    var feed: [IFeed] = []
    var offset: Int
    var error: ApiError?
    
    private var _observer: QObserver< IFeedManagerObserver >
    private var _apiQuery: IQApiQuery?
    
    init(apiProvider: IApiProvider, user: IUser) {
        self.apiProvider = apiProvider
        self.user = user
        self.isLoadedFirstPage = false
        self.canLoadMore = true
        self.offset = 0
        self.feed = []
        self._observer = QObserver()
    }

    func add(observer: IFeedManagerObserver, priority: ObserverPriority) {
        self._observer.add(observer, priority: priority.rawValue)
    }
    
    func remove(observer: IFeedManagerObserver) {
         self._observer.remove(observer)
    }
    
    func load() {
        guard self.isLoading == false else { return }
        
        self._apiQuery = self.apiProvider.getFeeds(
            accessToken: self.user.accessToken,
            limit: 75,
            offset: self.offset,
            success: { [weak self] in self?._perform($0) },
            failure: { [weak self] in self?._perform($0) }
        )
    }
    
    func cancel() {
        self._apiQuery?.cancel()
        self._apiQuery = nil
    }
    
}

private extension ApiFeedManager {
    
    func _perform(_ feed: [IFeed]) {
        let isFirst = self.isLoadedFirstPage
        self.isLoadedFirstPage = true
        self.canLoadMore = feed.count == 75
        self.offset += 75
        self.feed.append(contentsOf: feed)
        self.error = nil
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, feed: feed, isFirst: isFirst) })
    }

    func _perform(_ error: ApiError) {
        self.error = error
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, error: error) })
    }

}
