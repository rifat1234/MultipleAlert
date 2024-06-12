//
//  ContentView.swift
//  MultipleAlert
//
//  Created by Rifat Monzur on 12/6/24.
//

import SwiftUI

enum AlertContent {
    case even(num:Int), odd(num:Int)
    
    var title:String {
        switch self {
        case .even:
            "Even"
        case .odd:
            "Odd"
        }
    }
    
    var message:String {
        switch self {
        case .even(let num):
            "\(num) is even"
        case .odd(let num):
            "\(num) is odd"
        }
    }
}

struct ContentView: View {
    @State private var showAlert:Bool = false
    @State private var num = 2
    @State private var alertContent:AlertContent = .even(num: 2)
    
    var body: some View {
        VStack {
            TextField("Enter number: ", value: $num, format:.number)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 150)
            Button("Show Alert if number is odd or even") {
                alertContent = (num % 2 == 0) ? .even(num: num) : .odd(num: num)
                showAlert = true
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertContent.title), message: Text(alertContent.message), dismissButton: .cancel() )
            })
        }
    }
}

#Preview {
    ContentView()
}
