//
//  ListItemDetails.swift
//  MidTerm6
//
//  Created by Daniel Jasinski on 10/6/20.
//  Copyright © 2020 Daniel Jasinski. All rights reserved.
//

import SwiftUI

struct ListItemDetails: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo: String = ""
    var body: some View {
        ForEach (self.taskStore.tasks) {
            task in Text (task.toDoITem)
                        .font(.title)
                        .position(x:180, y: 25)
        }
            .font(.title)
            .position(x:180, y: 25)
    
    }
}

struct ListItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ListItemDetails()
    }
}
