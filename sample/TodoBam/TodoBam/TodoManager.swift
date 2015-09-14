//
//  TodoManager.swift
//  TodoBam
//
//  Created by dev.bamssong on 2015. 8. 27..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation

let ModelChangedNotification = "ModelChangedNotification"



struct Todo{
    var title:String!
    var text:String!
    var duedate:NSDate!
}

struct TodoPrintable : Printable {
    var todo : Todo?
    
    init(item : Todo) {
        self.todo = item
    }
    
    init() {
        
    }
    
    var description: String {
        var desc = "title: \(todo?.title) \nduedate : \(todo?.duedate)"
        return desc
    }
}

@objc protocol TodoManagerDelegate {
    optional func changedTodo() -> Void
}


class TodoManager {

    class var sharedManager : TodoManager {
        struct Instance {
            static var instance : TodoManager!
        }
        
        if Instance.instance == nil {
            Instance.instance = TodoManager()
        }
        
        return Instance.instance
    }
    
    var todoList = [Todo]()
    
    func add(todo : Todo) {
        todoList.append(todo)
        NSNotificationCenter.defaultCenter().postNotificationName(ModelChangedNotification, object: nil)
    }
    
    func delete(todo : Todo) {
        var i = 0
        for tempTodo in todoList {
            if tempTodo.title == todo.title {
                break;
            }
            i++
        }
        
        todoList.removeAtIndex(i)
        NSNotificationCenter.defaultCenter().postNotificationName(ModelChangedNotification, object: nil)
    }
    
    func delete(index: Int) {
        todoList.removeAtIndex(index)
        NSNotificationCenter.defaultCenter().postNotificationName(ModelChangedNotification, object: nil)
    }
    
    func clearAll(){
        todoList.removeAll(keepCapacity: false)
        NSNotificationCenter.defaultCenter().postNotificationName(ModelChangedNotification, object: nil)
    }
}