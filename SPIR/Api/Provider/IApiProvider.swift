//
//  SPIR
//

import Quickly

protocol IApiProvider {
    
    func login(
        username: String,
        password: String,
        success: @escaping (_ user: IUser) -> Void,
        failure: @escaping (_ error: ApiError) -> Void
    ) -> IQApiQuery
    
    func getFeeds(
        accessToken: String,
        limit: Int,
        offset: Int,
        success: @escaping (_ feed: [IFeed]) -> Void,
        failure: @escaping (_ error: ApiError) -> Void
    ) -> IQApiQuery
    
    func getMessage(
        accessToken: String,
        materialId: String,
        query: String,
        success: @escaping (_ message: IMessage) -> Void,
        failure: @escaping (_ error: ApiError) -> Void
    ) -> IQApiQuery
}
