//
//  SPIR
//

import Quickly

class ApiProvider {
    
    private var _provider: QApiProvider
    
    init(
        url: URL,
        proxy: IQProxy? = nil
    ) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30
        sessionConfiguration.timeoutIntervalForResource = 60
        if let proxy = proxy {
            sessionConfiguration.connectionProxyDictionary = proxy.dictionary
        }
        sessionConfiguration.urlCache = nil
        
        let sessionQueue = OperationQueue()
        sessionQueue.maxConcurrentOperationCount = 1
        
        self._provider = QApiProvider(
            baseUrl: url,
            sessionConfiguration: sessionConfiguration,
            sessionQueue: sessionQueue
        )
        #if DEBUG
        self._provider.logging = .whenError
        self._provider.allowInvalidCertificates = true
        #endif
    }
    
}

extension ApiProvider : IApiProvider {
    
    func login(
        username: String,
        password: String,
        success: @escaping (IUser) -> Void,
        failure: @escaping (ApiError) -> Void
    ) -> IQApiQuery {
        return self._provider.send(
            request: try! ApiLoginQuery.Request(username: username, password: password),
            response: ApiLoginQuery.Response(),
            completed: { (request, response) in
                if let error = response.apiError {
                    failure(error)
                } else {
                    success(response.user)
                }
            }
        )
    }
    
}
