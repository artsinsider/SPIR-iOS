//
//  SPIR
//

import Foundation

class LoadingFeedManager : IFeedManager {
    
    var isLoading: Bool {
        return true
    }
    var isLoadedFirstPage: Bool {
        return false
    }
    var canLoadMore: Bool {
        return true
    }
    var feed: [IFeed] {
        return []
    }
    var error: ApiError? {
        return nil
    }
    
    func add(observer: IFeedManagerObserver, priority: ObserverPriority) {
    }
    
    func remove(observer: IFeedManagerObserver) {
    }
    
    func load() {
    }
    
    func cancel() {
    }
    
}
