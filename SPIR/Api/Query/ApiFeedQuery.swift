//
//  SPIR
//

import Quickly

struct ApiFeedQuery {
    
    class Request : ApiQuery.Request {
        
        init(accessToken: String, limit: Int, offset: Int) throws {
            let params = QJson()
            try params.set("", path: "query")
            try params.set([] as [String], mandatory: false, path: "fields")
            try params.set(NSNull(), path: "filter.date_from")
            try params.set(NSNull(), path: "filter.date_to")
            try params.set([] as [String], mandatory: false, path: "filter.products")
            try params.set([] as [String], mandatory: false, path: "filter.genre_id")
            try params.set([] as [String], mandatory: false, path: "filter.rubric_id")
        
            try params.set(limit, path: "limit")
            try params.set(offset, path: "offset")
            
            try super.init(method: "Material.search", params: params)
            self.set(header: "Authorization", value: "Bearer \(accessToken)")
        }
               
    }
    
    class Response : ApiQuery.Response {
        
        var feeds: [ApiFeed]!
        
        override func parse(json: QJson) throws {
            self.feeds = try json.get(mandatory: true, path: "result.materials")
        }
        
    }

}
