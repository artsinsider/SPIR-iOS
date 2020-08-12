//
//  SPIR
//

import Quickly

struct ApiQuery {
    
    class Request : QApiRequest {
        
        init(method: String, params: QJson) throws {
            super.init(method: "POST")
            
            let json = QJson()
            try json.set(Int.random(in: 1..<99), path: "id")
            try json.set(method, path: "method")
            try json.set("2.0", path: "jsonrpc")
            try json.setAny(params.root!, path: "params")
            self.bodyData = try json.saveAsData()
        }
               
    }
    
    class Response : QApiResponse {

        var apiError: ApiError? {
            get { return self.error as? ApiError }
        }
        
        override func parse(data: Data) throws {
            if let json = try? QJson(data: data) {
                try self.parse(json: json)
            } else {
                throw ApiError.invalidResponse
            }
        }

        override func parse(error: Error) {
            if let error = error as? ApiError {
                self.error = error
            } else if let error = error as? QApiError {
                switch error {
                case .invalidResponse: self.error = ApiError.invalidResponse
                }
            } else {
                let nsError = error as NSError
                switch nsError.domain {
                case NSURLErrorDomain:
                    switch nsError.code {
                    case NSURLErrorNotConnectedToInternet: self.error = ApiError.notConnectedToInternet
                    case NSURLErrorTimedOut: self.error = ApiError.timeout
                    default: self.error = ApiError.invalidResponse
                    }
                default: self.error = ApiError.invalidResponse
                }
            }
        }
        
        func parse(json: QJson) throws {
            throw ApiError.invalidResponse
        }
        
    }

}
