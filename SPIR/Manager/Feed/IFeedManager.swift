//
//  SPIR
//

import Foundation

protocol IFeedManager {
    
    var isLoading: Bool { get }
    var isLoadedFirstPage: Bool { get }
    var canLoadMore: Bool { get }
    var feed: [IFeed] { get }
    var error: ApiError? { get }
    
    func add(observer: IFeedManagerObserver, priority: ObserverPriority)
    func remove(observer: IFeedManagerObserver)
    
    func load()
    func cancel()
    
}

protocol IFeedManagerObserver : class {

    func didFinish(_ manager: IFeedManager, feed: [IFeed], isFirst: Bool)
    func didFinish(_ manager: IFeedManager, error: ApiError)

}
