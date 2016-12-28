//
//  ViewController.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import UIKit
import SCLAlertView
class ViewController: UIViewController , UIGestureRecognizerDelegate {
    
    //@outLets
    @IBOutlet weak var tableView: UITableView!
    
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
        addLongtapGesture()
    }
    
    func addLongtapGesture() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(longPressGesture:)) )
        let swipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(swipeGestureRecognizer:)) )
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    
    func swipeGesture(swipeGestureRecognizer : UISwipeGestureRecognizer) {
        print("swiped")
        self.view.squareLoading.start(0.0)
        URLCache.shared.removeAllCachedResponses()
        getData()
    }
    func handleLongPress(longPressGesture:UILongPressGestureRecognizer) {
        
        let p = longPressGesture.location(in: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: p)
        
        if indexPath == nil {
            print("Long press on table view, not row.")
        }
        else if (longPressGesture.state == UIGestureRecognizerState.began) {
            print("Long press on row, at \(indexPath!.row)")
            if let index = indexPath?.row , index < repoFullData.count {
            self.showAlert(index: index)
            }
        }
        
    }
    
    func showAlert(index:Int) {
        let alertView = SCLAlertView()
        alertView.addButton("Repository") {
            print("1st button tapped")
             let urlString = self.repoFullData[index].htmlUrl
            guard let url = URL(string: urlString) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print("saddsadsa %@",url)
        }
        alertView.addButton("Owner") {
            print("Second button tapped")
            guard   let urlString = self.repoFullData[index].repoOwner?.htmlUrl ,  let url = URL(string: urlString) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print("saddsadsa %@",url)
        }
        alertView.showSuccess("Select Destination", subTitle: "Go To")
        
    }
    
    func pageingTableView() {
        if self.numberOfItemPerPage < repoFullData.count {
            self.itemPerPage(returnedData: repoFullData)
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
            self.view.squareLoading.stop(0.0)

        }
    }
}

