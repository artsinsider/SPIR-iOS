//
//  SPIR
//

import Foundation

protocol ILoginManager {
    
    var isLoading: Bool { get }
    var user: IUser? { get }
    var error: ApiError? { get }
    
    func add(observer: ILoginManagerObserver, priority: ObserverPriority)
    func remove(observer: ILoginManagerObserver)
    
    func perform(
        username: String,
        password: String
    )
    
}

protocol ILoginManagerObserver : class {

    func didFinish(_ manager: ILoginManager, user: IUser)
    func didFinish(_ manager: ILoginManager, error: ApiError)

}
