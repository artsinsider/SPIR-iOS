//
//  SPIR
//

import Foundation

protocol IFeed {
    
    var id: String { get }
    
    var isViewed: Bool { get }
    var isFavorite: Bool { get }

    var headLine: String? { get }
    var slug: String { get }
    var sourceName: String? { get }
    var lead: String { get }
    
    var newsDate: Date { get }
}
