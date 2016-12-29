//
//  VCTapGesture.swift
//  AppsSquareTask
//
//  Created by Killvak on 29/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import UIKit
extension ViewController :  UIGestureRecognizerDelegate {
    
    func addTapGestures() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(longPressGesture:)) )
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    
    
    
    func respondToSwipeGesture(swipeGestureRecognizer : UIGestureRecognizer) {
        self.view.squareLoading.start(0.0)
        URLCache.shared.removeAllCachedResponses()
        getData()
    
    }
    
    
    
    
    func handleLongPress(longPressGesture:UILongPressGestureRecognizer) {
        
        let p = longPressGesture.location(in: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: p)
        
        if indexPath == nil {
        }
        else if (longPressGesture.state == UIGestureRecognizerState.began) {
            print("Long press on row, at \(indexPath!.row)")
            if let index = indexPath?.row {
                self.showAlert(index: index)
            }
        }
        
    }
    
}
