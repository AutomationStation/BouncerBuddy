//
//  HomeModel.swift
//  BouncerBuddy
//
//  Created by Sha Wu on 16/3/7.
//  Copyright © 2016年 Sheryl Hong. All rights reserved.
//

import Foundation

protocol HomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "https://cgi.soic.indiana.edu/~hong43/blacklistconn.php"
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let bannedlist: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i++)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let banned = BannedModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["name"] as? String,
                let gender = jsonElement["gender"] as? String,
                
                let notes = jsonElement["notes"] as? String
            
            {
                
                banned.name = name
                banned.gender  = gender
                banned.notes = notes
               
                
                
            }
            
            bannedlist.addObject(banned)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(bannedlist)
            
        })
    }
}
