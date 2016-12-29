//
//  VCTableDataSource.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate {
    
    func infiniteTableScrolling() {
        tableView.infiniteScrollIndicatorStyle = .white
        tableView.addInfiniteScroll { (tableView) -> Void in
            // update table view
            self.pageingTableView()
            // finish infinite scroll animation
            tableView.finishInfiniteScroll()
        }
    }
    
    func pageingTableView() {
        if self.numberOfItemPerPage < repoFullData.count {
            self.itemPerPage(returnedData: repoFullData)
        }
    }
}

extension UITableView {
    func scrollToTop(animated: Bool) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}
