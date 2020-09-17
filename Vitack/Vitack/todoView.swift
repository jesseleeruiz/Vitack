//
//  todoView.swift
//  Vitack
//
//  Created by Jesse Ruiz on 9/17/20.
//

import SwiftUI

struct todoView: View {
    
    @State var text = String()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Enter a new Todo")
                .font(.largeTitle)
            
            TextEditor(text: .constant("Placeholder"))
                .padding(.horizontal)
            
            Button(
                action: saveTodo,
                label: {
                Text("Save")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(35)
            })
            Spacer()
                .frame(height:30)
        }
    }
    func saveTodo() {
        print(text)
        presentationMode.wrappedValue.dismiss()
    }
}

struct todoView_Previews: PreviewProvider {
    static var previews: some View {
        todoView()
    }
}
