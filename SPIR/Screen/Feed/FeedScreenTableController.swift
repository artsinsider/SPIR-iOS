//
//  SPIR
//

import Quickly

class FeedScreenTableController : QTableController, IQContextable {
    
    var context: IFeedScreenContext

    init(context: IFeedScreenContext) {
        self.context = context
        
        super.init(
            cells: [
                FeedScreenLoadingCell.self
            ]
        )
    }
    
    override func rebuild() {
        self.sections = [
            QTableSection(rows: [
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow()
            ])
        ]
        super.rebuild()
    }
    
}
