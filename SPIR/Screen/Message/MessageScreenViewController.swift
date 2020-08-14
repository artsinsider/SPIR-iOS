//
//  SPIR
//

import Quickly

class MessageScreenViewController : QNibViewController, IQContextable, IQRouterable {
    
    var context: IMessageScreenContext
    var router: IMessageScreenRouter
    
    @IBOutlet weak var dateMessage: UILabel!
    @IBOutlet weak var headLineMessage: UILabel!
    @IBOutlet weak var slugLineMessage: UILabel!
    @IBOutlet weak var textMessage: UILabel!
    
    init(context: IMessageScreenContext, router: IMessageScreenRouter) {
        self.context = context
        self.router = router
        
        super.init()
        
        self.context.messageManager.add(observer: self, priority: .ui)
    }
    
    deinit {
        self.context.messageManager.remove(observer: self)
    }
    
    override func didLoad() {
        super.didLoad()
        
        let backButton = QButton(styleSheet: QButtonStyleSheet(
            normalStyle: QButton.StateStyle(
                text: QLabelStyleSheet(
                    text: QText(
                        text: "Back",
                        font: UIFont.systemFont(ofSize: 25),
                        color: .systemBlue
                    )
                )
            )
        ))
        backButton.onPressed = { [weak self] _ in
            guard let self = self else { return }
            self.router.close(self)
        }
        
        let stackbar = QStackbar()
        stackbar.leftViews = [
            backButton
        ]
        stackbar.centerViews = [
            QLabel(styleSheet: QLabelStyleSheet(
                text: QText(
                    text: "Message",
                    font: UIFont.systemFont(ofSize: 25),
                    color: .systemBlue
                )
            ))
        ]
        self.stackbar = stackbar
        
        self.view.backgroundColor = UIColor.white
        
        self.context.messageManager.loadIfNeeded()
    }
    
}

extension MessageScreenViewController : IMessageManagerObserver {
    
    func didFinish(_ manager: IMessageManager, message: IMessage) {
        self.dateMessage.text = message.newsDate.format("YYYY-mm-dd")
        self.headLineMessage.text = message.headLine
        self.slugLineMessage.text = message.slug
        self.textMessage.text = message.text
    }
    
    func didFinish(_ manager: IMessageManager, error: ApiError) {
    }
    
}
    
