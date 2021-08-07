//
//  ContentView.swift
//  FetchingData
//
//  Created by Jessica Perez on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
                URLSession.shared.dataTask(with: <#T##URLRequest#>)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
