//
//  HomeViewController.swift
//  Family ToDo
//
//  Created by Furqan on 2/9/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var toDoArray :[ToDo]!
    
    var firebase = Firebase(url:"https://to-do-list-furqan.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase.observeEventType(.ChildAdded,
            withBlock: { snapshot in
                if let Snapshot = snapshot.value as? NSDictionary {
                    let dict = Snapshot as Dictionary
                    ToDo.sharedInstance.appendToDo(dict)
                    self.tableView.reloadData()
                }
            },
            withCancelBlock: { error in
                println(error.description)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return ToDo.sharedInstance.ToDoList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        let toDoCell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as ToDoCell
        let todo = ToDo.sharedInstance.ToDoList[indexPath.row]
        toDoCell.ToDoTitle.text = todo.Title
        toDoCell.ToDoDescription.text = todo.Description
        toDoCell.ToDoTimeLeft.text = todo.Interval
        return toDoCell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ToDo.sharedInstance.ToDoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
}
