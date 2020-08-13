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
                FeedScreenLoadingCell.self,
                FeedScreenContentCell.self
            ]
        )
    }
    
    override func rebuild() {
        var rows: [IQTableRow] = []
        if self.context.feedManager.isLoading && !self.context.feedManager.isLoadedFirstPage {
            rows.append(contentsOf: [
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow(),
                FeedScreenLoadingRow()
            ])
        } else if self.context.feedManager.feed.count > 0 {
            rows.append(contentsOf: self.context.feedManager.feed.compactMap({
                return FeedScreenContentRow(feed: $0)
            }))
        }
        self.sections = [
            QTableSection(rows: rows)
        ]
        super.rebuild()
    }
    
}
