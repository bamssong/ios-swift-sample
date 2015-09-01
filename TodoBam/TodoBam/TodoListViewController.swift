//
//  TodoListViewController.swift
//  TodoBam
//
//  Created by dev.bamssong on 2015. 8. 27..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController ,TodoManagerDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func handleAddTodo(sender: AnyObject) {
        var todo = Todo()
        todo.title = "text title"
        todo.duedate = NSDate()
        TodoManager.sharedManager.add(todo)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changedTodo", name: ModelChangedNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func changedTodo() {
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedManager.todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("TODO_CELL") as! UITableViewCell
        var todo = TodoManager.sharedManager.todoList[indexPath.row]
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a" // superset of OP's format
        let duedate = dateFormatter.stringFromDate(todo.duedate)
        cell.detailTextLabel!.text = duedate
        cell.textLabel!.text = todo.title
        return cell
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
