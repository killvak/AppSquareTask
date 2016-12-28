//
//  ViewController.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@outLets
    @IBOutlet weak var tableView: UITableView!
    
    //@endOutLets
    
    //@vars
    let parseJson = ParseData()
    var repoData = [RepoVars]()
    //@endVars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableView.register(cellClass, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
     
        parseJson.GetData { (data) in
            
            guard let data = data else { return }
            self.repoData = data
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

