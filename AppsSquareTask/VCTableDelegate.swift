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
    


    
    func pageingTableView() {
        if self.numberOfItemPerPage < repoFullData.count {
            self.itemPerPage(returnedData: repoFullData)
        }
    }
}
