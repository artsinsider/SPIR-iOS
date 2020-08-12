//
//  SPIR
//

import Foundation

protocol IUser {
    
    var id: String { get }
    var email: String { get }
    var role: String { get }
    var name: String { get }
    var username: String { get }
    var accessToken: String { get }
    
}
