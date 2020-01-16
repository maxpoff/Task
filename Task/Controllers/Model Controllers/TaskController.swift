//
//  TaskController.swift
//  Task
//
//  Created by Maxwell Poffenbarger on 1/15/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    //Shared Instance
    static var sharedInstance = TaskController()
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true), NSSortDescriptor(key: "due", ascending: true)]
        
        let resultsController: NSFetchedResultsController<Task> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing: \(error.localizedDescription)")
        }
    }
    
//Source of Truth
//    var tasks: [Task] {
//
//        let moc = CoreDataStack.context
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//        let results = try? moc.fetch(fetchRequest)
//        return results ?? []
//    }
    
    //MARK: CRUD
    func add(taskWithName name: String, notes: String?, due: Date?) {
        Task(due: due, name: name, notes: notes)
        
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("There was a problem saving: \(error)")
        }
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistentStore()
    }
    
    func fetchTasks() -> [Task] {
        return []
    }
    
}//End of class
