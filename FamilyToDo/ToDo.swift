//
//  ToDo.swift
//  Family ToDo
//
//  Created by Furqan on 2/10/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import Foundation

class ToDo {

    
    var ToDoList: [ToDoStruct]!
    
    private let _toDo = ToDo()
    
    init() {
        
    }
    
    class var shareInstance: ToDo {
        struct Static {
            static var instance: ToDo?
        }
        
        if Static.instance == nil {
            Static.instance = ToDo()
        }
        
        return Static.instance!
    }
    
    func appendToDo(_todo: AnyObject) {
        let todo = ToDoStruct(Title: _todo.valueForKey("title") as String, Description: _todo.valueForKey("description") as String, Date: dateFromObject(_todo.valueForKey("date")))
        self.ToDoList.append(todo)
    }
    
    func dateFromObject(dateObject: AnyObject!) -> NSDate {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.timeZone = NSTimeZone(name: "GMT")
        let dateString = toString(dateObject)
        var date = dateFormatter.dateFromString(dateString)
        
        if date == nil {
            date = NSDate()
        }
        
        return date!
    }
}

struct ToDoStruct {
    var Title = ""
    var Description = ""
    var Date = NSDate()
}