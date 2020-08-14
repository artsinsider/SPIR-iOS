//
//  SPIR
//

import Quickly

protocol IMessageScreenContext : IQContext {

    var messageManager: IMessageManager { get }

}

protocol IMessageScreenRouter : IQRouter {

    func close(_ viewController: MessageScreenViewController)

}
