//
//  TableViewController.swift
//  Image Picker Training
//
//  Created by Ajay Mann on 31/08/16.
//  Copyright © 2016 Ajay Mann. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return memes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCustomCell
        cell.imageViewPFTableView.image = memes[indexPath.row].memedImage
        cell.labelOfTableView.text = "\(memes[indexPath.row].topText) + \(memes[indexPath.row].bottomText)"
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let object: AnyObject = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController")
        let detailVC = object as! MemeEditorViewController
        
        /* Pass the data from the selected row to the detail view and present it */
        detailVC.meme = memes[indexPath.row]
        self.showViewController(detailVC, sender: nil)
    }
    

}
