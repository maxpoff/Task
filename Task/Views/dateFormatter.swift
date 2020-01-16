//
//  dateFormatter.swift
//  Task
//
//  Created by Maxwell Poffenbarger on 1/15/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}//End of extension
