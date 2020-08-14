//
//  SPIR
//

import Quickly

protocol IMessageScreenContext : IQContext {

    var messageManager: IMessageManager { get }

}

protocol IMessageScreenRouter : IQRouter {

    func success(_ viewController: MessageScreenViewController, message: IMessage)

}
