//
//  ContentView.swift
//  MidTerm6
//
//  Created by Daniel Jasinski on 10/6/20.
//  Copyright © 2020 Daniel Jasinski. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Enter a new Item for your list!", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("+Task")
            })
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count+1), toDoITem: newToDo))
        self.newToDo = ""
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                    Text(task.toDoITem)
                        }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Tasks")
                    .navigationBarItems(trailing: EditButton())
                        }
                    }
                }
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete (at offsets: IndexSet) {
    taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
