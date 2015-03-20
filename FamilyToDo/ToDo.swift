//
//  ToDo.swift
//  Family ToDo
//
//  Created by Furqan on 2/10/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import Foundation

class ToDo {
    
    var ToDoList: [ToDoStruct] = []
    
    class var sharedInstance: ToDo {
        struct Static {
            static var instance: ToDo?
        }
        
        if Static.instance == nil {
            Static.instance = ToDo()
        }
        
        return Static.instance!
    }
    
    func appendToDo(_todo: AnyObject) {
        let todoDict = _todo as NSDictionary
        let todo = ToDoStruct(Title: todoDict.valueForKey("title") as String, Description: todoDict.valueForKey("description") as String, Interval: intervalSince(toString(todoDict.valueForKey("date")!)))
        ToDo.sharedInstance.ToDoList.append(todo)
    }
    
    
    /**
    Returns a string showing the amount of time since the date passed as parameter
    */
    func intervalSince(dateString: String) -> String {
        
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        println(formatter.stringFromDate(now))

        let _postDate = moment(dateString, "yyyyMMddHHmmss")
        
        if let postDate = _postDate {
            let timePassed = moment().intervalSince(postDate)
            
            var timePassedString = ""
            
            if Int(timePassed.years) > 0 {
                timePassedString += "\(Int(timePassed.years)) " + ((Int(timePassed.years) > 1) ? "years": "year") + " ago"
                return timePassedString
            }
            if Int(timePassed.months) > 0 {
                timePassedString += "\(Int(timePassed.months)) " + ((Int(timePassed.months) > 1) ? "months": "month") + " ago"
                return timePassedString
            }
            if Int(timePassed.days) > 0 {
                timePassedString += "\(Int(timePassed.days)) " + ((Int(timePassed.days) > 1) ? "days": "day") + " ago"
                return timePassedString
            }
            if Int(timePassed.minutes) > 0 {
                timePassedString += "\(Int(timePassed.minutes)) " + ((Int(timePassed.minutes) > 1) ? "minutes": "minute") + " ago"
                return timePassedString
            }
            if Int(timePassed.seconds) > 0 {
                timePassedString += "\(Int(timePassed.seconds)) " + ((Int(timePassed.seconds) > 1) ? "seconds": "second") + " ago"
                return timePassedString
            }
        }
        
        return ""
    }
    
}

struct ToDoStruct {
    var Title = ""
    var Description = ""
    var Interval = ""
}
