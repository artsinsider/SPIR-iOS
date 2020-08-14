//
//  SPIR
//

import Foundation

protocol IMessageManager {
    
    var isLoading: Bool { get }
    var message: IMessage? { get }
    var error: ApiError? { get }
    
    func add(observer: IMessageManagerObserver, priority: ObserverPriority)
    func remove(observer: IMessageManagerObserver)
    
    func loadIfNeeded()
    func cancel()
    
}

protocol IMessageManagerObserver : class {

    func didFinish(_ manager: IMessageManager, message: IMessage)
    func didFinish(_ manager: IMessageManager, error: ApiError)

}
