//
//  SPIR
//

import Quickly

struct ApiLoginQuery {
    
    class Request : ApiQuery.Request {
        
        init(username: String, password: String) throws {
            let params = QJson()
            try params.set(username, path: "username")
            try params.set(password, path: "password")
            
            try super.init(method: "User.login", params: params)
        }
               
    }
    
    class Response : ApiQuery.Response {
        
        var user: ApiUser!
        
        override func parse(json: QJson) throws {
            self.user = try json.get(path: "result.user")
        }
        
    }

}
