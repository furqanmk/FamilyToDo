//
//  NewToDoViewController.swift
//  Family ToDo
//
//  Created by Furqan on 2/9/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class NewToDoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dueOnDatePicker: UIDatePicker!
    var firebase = Firebase(url:"https://to-do-list-furqan.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addNewToDo(sender: AnyObject) {
        let newToDo = firebase.childByAutoId()
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let nowString = formatter.stringFromDate(now)
        var todo = ["date": nowString, "description": descriptionTextField.text, "title": titleTextField.text]
        newToDo.setValue(todo)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toDoDiscarded(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
