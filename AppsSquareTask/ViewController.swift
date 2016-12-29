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
    var loadingPaging = false
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
        tableView.infiniteScrollIndicatorStyle = .white
        tableView.addInfiniteScroll { (tableView) -> Void in
            // update table view
            self.pageingTableView()
            // finish infinite scroll animation
            tableView.finishInfiniteScroll()
        }
    }
    
    
       func openBrowser(url :URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    
    func showAlert(index:Int) {
        let alertView = SCLAlertView()
        if !userIsOffLine {
        alertView.addButton("Repository") {
            let urlString = self.repoFullData[index].htmlUrl
            guard let url = URL(string: urlString) else { return }
            
            self.openBrowser(url :url)
        }
        alertView.addButton("Owner") {
            guard   let urlString = self.repoFullData[index].repoOwner?.htmlUrl ,  let url = URL(string: urlString) else { return }
            self.openBrowser(url :url)
        }
        
        alertView.showSuccess("Select Destination", subTitle: "Go To")
        }else {
            SCLAlertView().showNotice("You'r Offline", subTitle: "please check your network connection") // Notice
        }
    }
    
    
    func itemPerPage(returnedData : [RepoVars]) {
        self.repoData = []
        self.numberOfItemPerPage += 10
        let i = self.numberOfItemPerPage
        print("number of items : \(i)")

        let arrayData = returnedData.prefix(i)
        
        for i in arrayData {
            self.repoData.append(i)
        }
        self.tableView.reloadData()
    }
    
    func getData() {
        tableView.scrollToTop(animated: true)
        self.numberOfItemPerPage = 0
        parseJson.GetData { (data) in
            
            guard let returnedData = data else { return }
            self.repoFullData = returnedData
            
            self.itemPerPage(returnedData: returnedData)
            if self.repoFullData.count < 1 {
                self.view.backgroundColor = UIColor.white
                self.setUpOffLineModeUI(labelsBool: false, tableBool: true, navText: "Offline Mode")
            }else {

                self.view.backgroundColor = UIColor.lightGray
                self.setUpOffLineModeUI(labelsBool: true, tableBool: false, navText: "Main Page")

            }
            self.view.squareLoading.stop(0.0)
            
        }
    }
    

    
    func setUpOffLineModeUI(labelsBool:Bool,tableBool:Bool,navText:String  ) {
        self.uAreOfflineLbl.isHidden = labelsBool
        self.uAreOffline2ndLbl.isHidden = labelsBool
        self.tableView.isHidden = tableBool
        self.navigationItem.title = navText
    }
}

