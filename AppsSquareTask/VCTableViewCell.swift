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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var repoLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configCell(data:RepoVars) {
        
        repoNameDataLBl.text = data.name
        usernameDataLbl.text = data.fullName
        descriptionLbl.text = data.description
        
        let fontColor = UIColor.white
        

        if  !data.fork{
            self.containerView.backgroundColor = UIColor(displayP3Red: 134/255, green: 235/255, blue: 0/255, alpha: 1.0   )
            repoNameDataLBl.textColor = fontColor
            usernameDataLbl.textColor = fontColor
            descriptionLbl.textColor = fontColor
        }else {
            self.containerView.backgroundColor = UIColor.white
            repoNameDataLBl.textColor = UIColor.black
            usernameDataLbl.textColor = UIColor.black
            descriptionLbl.textColor = UIColor.black
        }
    }
    
    
    
    

}
