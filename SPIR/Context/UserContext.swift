//
//  SPIR
//

import Quickly

class UserContext : IUserContext {
    
    var apiProvider: IApiProvider
    var user: IUser
    
    init(appContext: IAppContext, user: IUser) {
        self.apiProvider = appContext.apiProvider
        self.user = user
    }
    
}
