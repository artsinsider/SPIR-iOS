//
//  SPIR
//

import Quickly

class ApiUser : QJsonModel, IUser {
    
    var id: String
    var email: String
    var role: String
    var name: String
    var username: String
    var accessToken: String
    
    required init(json: QJson) throws {
        self.id = try json.get(path: "id")
        self.email = try json.get(path: "email")
        self.role = try json.get(path: "role")
        self.name = try json.get(path: "name")
        self.username = try json.get(path: "username")
        self.accessToken = try json.get(path: "access_token")
        
        try super.init(json: json)
    }
    
}
