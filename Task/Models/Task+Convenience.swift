//
//  Task+Convenience.swift
//  Task
//
//  Created by Maxwell Poffenbarger on 1/15/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(due: Date? = nil, isComplete: Bool = false, name: String, notes: String? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.due = due
        self.isComplete = isComplete
        self.name = name
        self.notes = notes
    }
}//End of extension
