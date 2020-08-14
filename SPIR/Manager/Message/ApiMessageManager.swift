//
//  SPIR
//

import Quickly

class ApiMessageManager : IMessageManager {
    
    var apiProvider: IApiProvider
    var user: IUser
    var materialId: String
    var query: String
    var isLoading: Bool {
        return self._apiQuery != nil
    }
    var message: IMessage?
    var error: ApiError?
    
    private var _observer: QObserver< IMessageManagerObserver >
    private var _apiQuery: IQApiQuery?
    
    init(
        apiProvider: IApiProvider,
        user: IUser,
        materialId: String,
        query: String
    ) {
        self.apiProvider = apiProvider
        self.user = user
        self.materialId = materialId
        self.query = query
        self._observer = QObserver()
    }
    
    func add(observer: IMessageManagerObserver, priority: ObserverPriority) {
        self._observer.add(observer, priority: priority.rawValue)
    }
    
    func remove(observer: IMessageManagerObserver) {
        self._observer.remove(observer)
    }
    
    func loadIfNeeded() {
        guard self.isLoading == false, self.message == nil else { return }
        self._apiQuery = self.apiProvider.getMessage(
            accessToken: self.user.accessToken,
            materialId: self.materialId,
            query: self.query,
            success: { [weak self] in self?._perform($0) },
            failure: { [weak self] in self?._perform($0) }
        )
    }
    
    func cancel() {
        self._apiQuery?.cancel()
        self._apiQuery = nil
    }
    
}

private extension ApiMessageManager {
    
    func _perform(_ message: IMessage) {
        self.message = message
        self.error = nil
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, message: message) })
    }
    
    func _perform(_ error: ApiError) {
        self.message = nil
        self.error = error
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, error: error) })
    }
    
}
