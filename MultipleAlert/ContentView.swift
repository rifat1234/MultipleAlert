//
//  ContentView.swift
//  MultipleAlert
//
//  Created by Rifat Monzur on 12/6/24.
//

import SwiftUI


struct ContentView: View {
    @State private var showEvenAlert:Bool = false
    @State private var showOddAlert:Bool = false
    @State private var num = 2
    
    var body: some View {
        VStack {
            TextField("Enter number: ", value: $num, format:.number)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 150)
                .alert(isPresented: $showOddAlert, content: {
                    Alert(title: Text("Odd"), message: Text("\(num) is odd"), dismissButton: .cancel() )
                })
            Button("Show Alert if number is even") {
                showEvenAlert = num % 2 == 0
                showOddAlert = num % 2 == 1
            }
            .alert(isPresented: $showEvenAlert, content: {
                Alert(title: Text("Even"), message: Text("\(num) is even"), dismissButton: .cancel() )
            })
            
            
        }
    }
}

#Preview {
    ContentView()
}
