//
//  userData.swift
//  MidTerm6
//
//  Created by Daniel Jasinski on 10/6/20.
//  Copyright © 2020 Daniel Jasinski. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoITem = String()
    var ToDoNotes = String()
    
    
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task] () 
}
