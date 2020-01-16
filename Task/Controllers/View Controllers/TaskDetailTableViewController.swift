//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Maxwell Poffenbarger on 1/15/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var taskNotesTextField: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    var task: Task?
    
    var dueDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = datePicker
        dueDateTextField.delegate = self
        taskNameTextField.text = task?.name
        taskNotesTextField.text = task?.notes
        dueDateTextField.text = task?.due?.stringValue()
        datePicker.date = task?.due ?? Date()
        dueDate = task?.due
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = task?.due?.stringValue()
    }
    
    //MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, let taskNotes = taskNotesTextField.text, let taskDueDate = dueDate else {return}
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: taskName, notes: taskNotes, due: taskDueDate)
        } else {
            TaskController.sharedInstance.add(taskWithName: taskName, notes: taskNotes, due: taskDueDate)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDate = sender.date
        dueDateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        taskNameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        taskNotesTextField.resignFirstResponder()
    }
    
    
    //MARK: Helper functions
    func updateViews() {
        guard let task = task else {return}
        
        taskNameTextField.text = task.name
        taskNotesTextField.text = task.notes
        dueDateTextField.text = task.due?.stringValue()
    }
    
}//End of class

