//
//  SPIR
//

import Quickly

class FeedScreenContentRow : QTableRow {
    
    let feed: IFeed
    
    init( feed: IFeed ) {
        self.feed = feed
        super.init(canSelect: true)
    }
    
}

class FeedScreenContentCell : QTableCell< FeedScreenContentRow > {
    
    @IBOutlet weak var headLable: UILabel!
    @IBOutlet weak var leadLable: UILabel!
    
    override func prepare(row: RowType, spec: IQContainerSpec, animated: Bool) {
        super.prepare(row: row, spec: spec, animated: animated)
        
        self.headLable.text = row.feed.headLine
        self.leadLable.text = row.feed.lead
    }
    
}
