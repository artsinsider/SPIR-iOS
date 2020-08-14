//
//  SPIR
//

import Quickly

struct ApiMessageQuery {
    
    class Request : ApiQuery.Request {
        
        init(accessToken: String, materialId: String, query: String) throws {
            let params = QJson()
         
            try params.set(Int(materialId)!, path: "material_id")
            try params.set(query, path: "query")
         
            try super.init(method: "Material.getById", params: params)
            self.set(header: "Authorization", value: "Bearer \(accessToken)")
        }
               
    }
    
    class Response : ApiQuery.Response {
        
        var message: ApiMessage!
        
        override func parse(json: QJson) throws {
            self.message = try json.get(path: "result.material")
        }
        
    }

}
