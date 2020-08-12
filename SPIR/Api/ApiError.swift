//
//  SPIR
//

enum ApiError : Error {
    
    // System
    case invalidRequest
    case invalidResponse
    case notConnectedToInternet
    case untrustedInternetConnection
    case timeout

    // Security
    case expiredToken
    
}
