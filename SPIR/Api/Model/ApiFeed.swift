//
//  SPIR
//

import Quickly

class ApiFeed : QJsonModel, IFeed {
    
    
    var id: String
    var isViewed: Bool
    var isFavorite: Bool
    var headLine: String?
    var slug: String
    var sourceName: String?
    var lead: String
    var newsDate: Date
    
    required init(json: QJson) throws {
        self.id = try json.get(path: "id")
        self.isViewed = try json.get(path: "viewed")
        self.isFavorite = try json.get(path: "favorite")
        self.headLine = try? json.get(path: "headline")
        self.slug = try json.get(path: "slug")
        self.sourceName = try? json.get(path: "source_name")
        self.lead = try json.get(path: "lead")
        self.newsDate = try json.get(path: "news_date")
        
        try super.init(json: json)
    }
    
}