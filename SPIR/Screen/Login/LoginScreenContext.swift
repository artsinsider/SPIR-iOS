//
//  SPIR
//

import Quickly

class LoginScreenContext : ILoginScreenContext {
    
    var loginManager: ILoginManager
    
    init(apiProvider: IApiProvider) {
        self.loginManager = ApiLoginManager(apiProvider: apiProvider)
    }
    
}
