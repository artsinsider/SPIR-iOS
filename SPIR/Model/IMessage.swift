//
//  SPIR
//

import Foundation

protocol IMessage : IFeed {
    
    var priority: String { get }

    var text: String { get }

}
