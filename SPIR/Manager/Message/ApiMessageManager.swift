//
//  SPIR
//

import Quickly

class ApiMessageManager : IMessageManager {
    
    var apiProvider: IApiProvider
    var isLoading: Bool {
        return self._apiQuery != nil
    }
    var message: IMessage?
    var error: ApiError?
    
    private var _observer: QObserver< IMessageManagerObserver >
    private var _apiQuery: IQApiQuery?
    
    init(
        apiProvider: IApiProvider
    ) {
        self.apiProvider = apiProvider
        self._observer = QObserver()
    }
    
    func add(observer: IMessageManagerObserver, priority: ObserverPriority) {
        self._observer.add(observer, priority: priority.rawValue)
    }
    
    func remove(observer: IMessageManagerObserver) {
        self._observer.remove(observer)
    }
    
    func perform(
        materialId: Int,
        query: String
    ) {
        guard self.isLoading == false else { return }
        self._apiQuery = self.apiProvider.getMessage(
            materialId: materialId,
            query: query,
            success: { [weak self] in self?._perform($0) },
            failure: { [weak self] in self?._perform($0) })
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
