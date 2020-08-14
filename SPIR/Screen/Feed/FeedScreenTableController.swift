//
//  SPIR
//

import Quickly

class FeedScreenTableController : QTableController, IQContextable {
    
    var context: IFeedScreenContext
    var pressedDetail: (_ feed: IFeed) -> Void

    init(
        context: IFeedScreenContext,
        pressedDetail: @escaping (_ feed: IFeed) -> Void
    ) {
        self.context = context
        self.pressedDetail = pressedDetail
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.row(indexPath: indexPath) {
        case let row as FeedScreenContentRow: self.pressedDetail(row.feed)
        default: break
        }
    }
    
}
