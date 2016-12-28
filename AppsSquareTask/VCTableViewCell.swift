//
//  VCTableViewCell.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import UIKit

class VCTableViewCell: UITableViewCell {
    @IBOutlet weak var repoNameDataLBl: UILabel!
    @IBOutlet weak var usernameDataLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configCell(data:RepoVars) {
        
        repoNameDataLBl.text = data.name
        usernameDataLbl.text = data.fullName
        descriptionLbl.text = data.description
        
    }
    
    
    

}
