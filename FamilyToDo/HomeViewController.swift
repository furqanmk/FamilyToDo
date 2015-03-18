//
//  HomeViewController.swift
//  Family ToDo
//
//  Created by Furqan on 2/9/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var tableViewSize = 5
    
    var toDoArray :[ToDo]!
    var firebase = Firebase(url:"https://to-do-list-furqan.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase.observeEventType(.ChildAdded, withBlock: { snapshot in
            if let Snapshot = snapshot.value as? NSDictionary {
                let dict = Snapshot as Dictionary
                
                
                
                for (_, _todo) in dict {
                    
                    ToDo.shareInstance.appendToDo(_todo)
                    
                    var dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyyMMddHHmmss"
                    dateFormatter.timeZone = NSTimeZone(name: "GMT")
                    let dateString = toString(_todo.valueForKey("date"))
                    let date = dateFormatter.dateFromString(dateString)
                    println(dateString)
                    println(date)
                    var todo = ToDoStruct(Title: _todo.valueForKey("title") as String, Description: _todo.valueForKey("description") as String, Date: NSDate())
                }
            }
            }, withCancelBlock: { error in
                
                println(error.description)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableViewSize
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as ToDoCell
        // Configure the cell...
        toDoCell.ToDoTitle.text = "Wash Dishes"
        toDoCell.ToDoDescription.text = "Mother's dishes have to be washed"
        toDoCell.ToDoTimeLeft.text = "2 Days Left"
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
            tableViewSize = tableViewSize - 1
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
