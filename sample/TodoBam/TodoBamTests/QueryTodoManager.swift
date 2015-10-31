//
//  QueryTodoManager.swift
//  TodoBam
//
//  Created by dev.bamssong on 2015. 9. 1..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation


class QeuryTodoManager {
    
    func testCreateTodo() -> Bool {
        
        var todo = Todo()
        todo.title = "test"
        todo.duedate = NSDate()
        
        print(TodoPrintable(item: todo))
        return true
    }
}