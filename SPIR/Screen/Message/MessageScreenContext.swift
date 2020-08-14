//
//  SPIR
//

import Quickly

class MessageScreenContext : IMessageScreenContext {
   
    var messageManager: IMessageManager
    
    init(apiProvider: IApiProvider) {
        self.messageManager = ApiMessageManager(apiProvider: apiProvider)
    }
    
}
