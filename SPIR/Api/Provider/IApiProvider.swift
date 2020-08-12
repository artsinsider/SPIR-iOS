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
    
}
