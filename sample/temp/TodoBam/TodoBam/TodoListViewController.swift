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
//        var todo = Todo()
//        todo.title = "text title"
//        todo.duedate = NSDate()
//        TodoManager.sharedManager.add(todo)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changedTodo", name: ModelChangedNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueID = segue.identifier {
            switch segueID {
            case "EDIT":
                if let detailViewController = segue.destinationViewController as? DetailViewController{
                    detailViewController.type = segueID
                }
                print("edit~~")
            case "NEW":
                if let detailViewController = segue.destinationViewController as? DetailViewController{
                    detailViewController.type = segueID
                }
                print("new~~")
            default:
                let error: NSError?
                NSException.raise("Exception", format:"Error: %@", arguments:getVaList([error ?? "nil"]))
            }
        }
    }
    
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        print("Unwind Segue!!")
    }
    
    
    // MARK: - TodoManager
    func changedTodo() {
        tableView.reloadData()
    }
    
    // MARK: - UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedManager.todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TODO_CELL") as! TodoTableViewCell
        let todo = TodoManager.sharedManager.todoList[indexPath.row]

        cell.labelTitle.text = todo.title
        cell.labelText.text = todo.text
        return cell
    }



}
