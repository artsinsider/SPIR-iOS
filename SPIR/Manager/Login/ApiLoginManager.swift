//
//  SPIR
//

import Quickly

class ApiLoginManager : ILoginManager {
    
    var apiProvider: IApiProvider
    var isLoading: Bool {
        return self._apiQuery != nil
    }
    var user: IUser?
    var error: ApiError?
    
    private var _observer: QObserver< ILoginManagerObserver >
    private var _apiQuery: IQApiQuery?
    
    init(
        apiProvider: IApiProvider
    ) {
        self.apiProvider = apiProvider
        self._observer = QObserver()
    }
    
    func add(observer: ILoginManagerObserver, priority: ObserverPriority) {
        self._observer.add(observer, priority: priority.rawValue)
    }
    
    func remove(observer: ILoginManagerObserver) {
        self._observer.remove(observer)
    }
    
    func perform(
        username: String,
        password: String
    ) {
        guard self.isLoading == false else { return }
        self._apiQuery = self.apiProvider.login(
            username: username,
            password: password,
            success: { [weak self] in self?._perform($0) },
            failure: { [weak self] in self?._perform($0) }
        )
    }
    
}

private extension ApiLoginManager {
    
    func _perform(_ user: IUser) {
        self.user = user
        self.error = nil
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, user: user) })
    }

    func _perform(_ error: ApiError) {
        self.user = nil
        self.error = error
        self._apiQuery = nil
        self._observer.notify({ $0.didFinish(self, error: error) })
    }

}
