//
//  ContentView.swift
//  Vitack
//
//  Created by Jesse Ruiz on 9/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = Array(0..<100).map { _ in UUID().uuidString }
    
    @State var showTodo = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        Text(todo)
                    }
                    .onDelete(perform: deleteTodo)
                }
                VStack {
                    Spacer()
                    
                    Button(
                        action: { showTodo.toggle() },
                        label: {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    Spacer()
                        .frame(height: 30)
                }
            }
            .navigationTitle("Todo")
            .sheet(isPresented: $showTodo, content: {
                todoView()
            })
        }
    }
    func deleteTodo(at indexSet: IndexSet) {
        print("Deleted item at: \(indexSet)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
