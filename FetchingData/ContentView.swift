//
//  ContentView.swift
//  FetchingData
//
//  Created by Jessica Perez on 8/7/21.
//

import SwiftUI

//MARK: - Properties

//user struct
struct User {
    var id: Int
    var name: String
    var username: String
    var email: String
    var adress: Adress
    
}
//struct adress

struct Adress {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var  geo: Geo
}
//geo struct properties
struct Geo {
    var lat: String
    var lng: String
}


//MARK: - Body
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                //you want to avoid this because app will crash
                let url = URL(string: "https://swapi.dev/api/people/1")!
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
