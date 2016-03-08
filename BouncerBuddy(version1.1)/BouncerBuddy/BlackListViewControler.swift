//
//  BlackListViewControler.swift
//  BouncerBuddy
//
//  Created by Sha Wu on 16/3/7.
//  Copyright © 2016年 Sheryl Hong. All rights reserved.
//

import UIKit

class BlackListViewControler: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : BannedModel = BannedModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        //print(feedItems.count)
        return feedItems.count
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        // Get the location to be shown
        let item: BannedModel = feedItems[indexPath.row] as! BannedModel
        // Get references to labels of cell
        
        myCell.textLabel!.text = item.name
        
     
        return myCell
    }
    
}



