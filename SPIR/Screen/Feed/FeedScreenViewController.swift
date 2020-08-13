//
//  SPIR
//

import Quickly

class FeedScreenViewController : QTableViewController, IQContextable, IQRouterable {
    
    var context: IFeedScreenContext
    var router: IFeedScreenRouter
    
    private var _tableController: FeedScreenTableController! {
        didSet { self.tableController = self._tableController }
    }
    
    init(context: IFeedScreenContext, router: IFeedScreenRouter) {
        self.context = context
        self.router = router
        
        super.init()
        
        self.context.feedManager.add(observer: self, priority: .ui)
    }
    
    deinit {
        self.context.feedManager.remove(observer: self)
    }
    
    override func didLoad() {
        super.didLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self._tableController = FeedScreenTableController(
            context: self.context
        )
        
        self.context.feedManager.load()
    }
    
}

extension FeedScreenViewController : IFeedManagerObserver {
    
    func didFinish(_ manager: IFeedManager, feed: [IFeed], isFirst: Bool) {
        self._tableController.rebuild()
    }
    
    func didFinish(_ manager: IFeedManager, error: ApiError) {
        print("error: \(error)")
    }
    
}
