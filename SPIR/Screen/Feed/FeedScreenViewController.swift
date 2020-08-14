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
        
        let stackbar = QStackbar()
        stackbar.centerViews = [
            QLabel(styleSheet: QLabelStyleSheet(
                text: QText(
                    text: "Feed",
                    font: UIFont.systemFont(ofSize: 25),
                    color: .systemBlue
                ),
                alignment: .center
            ))
        ]
        self.stackbar = stackbar
        
        self.view.backgroundColor = UIColor.white
        
        self._tableController = FeedScreenTableController(
            context: self.context,
            pressedDetail: { [weak self] feed in
                guard let self = self else { return }
                self.router.detail(self, feed: feed)
            }
        )
        
        self.context.feedManager.load()
    }
    
    override func finishInteractivePresent() {
        super.finishInteractivePresent()
        
        if let selectedIndexPath = self.tableView?.indexPathForSelectedRow {
            self.tableView?.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    override func didPresent(animated: Bool) {
        super.didPresent(animated: animated)
        
        if let selectedIndexPath = self.tableView?.indexPathForSelectedRow {
            self.tableView?.deselectRow(at: selectedIndexPath, animated: true)
        }
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
