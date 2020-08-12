//
//  SPIR
//

import Quickly

protocol ILoginScreenContext : IQContext {
    
    var loginManager: ILoginManager { get }
    
}

protocol ILoginScreenRouter : IQRouter {
    
    func success(_ viewController: LoginScreenViewController)
    
}
