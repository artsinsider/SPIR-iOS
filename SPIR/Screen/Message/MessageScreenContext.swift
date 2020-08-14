//
//  SPIR
//

import Quickly

class MessageScreenContext : IMessageScreenContext {
   
    var messageManager: IMessageManager
    
    init(
        apiProvider: IApiProvider,
        user: IUser,
        materialId: String,
        query: String
    ) {
        self.messageManager = ApiMessageManager(
            apiProvider: apiProvider,
            user: user,
            materialId: materialId,
            query: query
        )
    }
    
}
