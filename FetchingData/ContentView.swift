//
//  ContentView.swift
//  FetchingData
//
//  Created by Jessica Perez on 8/7/21.
//

import SwiftUI

//MARK: - Properties



//MARK: - Body
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                //you want to avoid this because app will crash
                let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
                //closer a funcion withing a function
                URLSession.shared.dataTask(with: url) { data, response, error in //given three paramater data,resposnse, error
                    if let error = error {
                        print(error.localizedDescription)
                    } else { //we dont want optinal data
                        if let data = data { //unwrapping this data
                            print(String(data: data, encoding: .utf8)) //a type of way this data is encoded , prints to console
                        }
                    }
                    
                }.resume()
            })
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
