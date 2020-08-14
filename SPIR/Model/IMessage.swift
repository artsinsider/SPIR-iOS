//
//  SPIR
//

import Foundation

protocol IMessage {
    
    var id: String { get }
    
    var priority: String { get }
    var isFavorite: Bool { get }

    var headLine: String? { get }
    var slug: String { get }
    var sourceName: String? { get }
    var lead: String { get }
    var text: String { get }
    
    var newsDate: Date { get }
}
