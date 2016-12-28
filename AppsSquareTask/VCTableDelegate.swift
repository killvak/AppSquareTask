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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
            if offsetY > contentHeight - scrollView.frame.size.height {
        self.pageingTableView()
        }
    }
    
    func pageingTableView() {
        if self.numberOfItemPerPage < repoFullData.count {
            self.itemPerPage(returnedData: repoFullData)
        }
    }
}
