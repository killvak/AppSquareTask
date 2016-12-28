//
//  ViewController.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import UIKit
import SCLAlertView
class ViewController: UIViewController  {
    
    //@outLets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var uAreOfflineLbl: UILabel!
    @IBOutlet weak var uAreOffline2ndLbl: UILabel!
    
    //@endOutLets
    
    //@vars
    let parseJson = ParseData()
    var repoData = [RepoVars]()
    var repoFullData = [RepoVars]()
    
    var numberOfItemPerPage = 0
    //@endVars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        tableView.register(cellClass, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.squareLoading.start(0.0)
        getData()
        addTapGestures()
    }
    
    
   
    func showAlert(index:Int) {
        let alertView = SCLAlertView()
        alertView.addButton("Repository") {
            print("1st button tapped")
            let urlString = self.repoFullData[index].htmlUrl
            guard let url = URL(string: urlString) else { return }
         
            self.openBrowser(url :url)
        }
        alertView.addButton("Owner") {
            print("Second button tapped")
            guard   let urlString = self.repoFullData[index].repoOwner?.htmlUrl ,  let url = URL(string: urlString) else { return }
            self.openBrowser(url :url)
        }
        
        alertView.showSuccess("Select Destination", subTitle: "Go To")
        
    }
    
    func openBrowser(url :URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    
    func itemPerPage(returnedData : [RepoVars]) {
        self.numberOfItemPerPage += 10
        let i = self.numberOfItemPerPage
        let arrayData = returnedData.prefix(i)
        
        for i in arrayData {
            self.repoData.append(i)
        }
        self.tableView.reloadData()
    }
    
    func getData() {
        
        parseJson.GetData { (data) in
            
            guard let returnedData = data else { return }
            self.repoFullData = returnedData
            
            self.itemPerPage(returnedData: returnedData)
            if self.repoFullData.count < 1 {
                self.uAreOfflineLbl.isHidden = false
                self.uAreOffline2ndLbl.isHidden = false
                self.tableView.isHidden = true
                self.view.backgroundColor = UIColor.white
            }else {
                self.uAreOfflineLbl.isHidden = true
                self.uAreOffline2ndLbl.isHidden = true
                self.tableView.isHidden = false
                self.view.backgroundColor = UIColor.lightGray
            }
            self.view.squareLoading.stop(0.0)
            
        }
    }
}

