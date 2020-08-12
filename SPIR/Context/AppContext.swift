//
//  SPIR
//

import Quickly

class AppContext : IAppContext {
    
    var apiProvider: IApiProvider
    
    init(url: URL) {
        self.apiProvider = ApiProvider(url: url)
    }
    
}
