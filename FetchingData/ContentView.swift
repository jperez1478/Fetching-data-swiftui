//
//  ContentView.swift
//  FetchingData
//
//  Created by Jessica Perez on 8/7/21.
//

import SwiftUI

//MARK: - Properties


//user struct
struct User: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var adress: Adress
    
}
//struct adress

struct Adress: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var  geo: Geo
}
//geo struct properties
struct Geo: Decodable {
    var lat: String
    var lng: String
}


//MARK: - Body
struct ContentView: View {
    @State var users = [User]() //representing empty user array
    
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
                            let decoder = JSONDecoder()
                            do {
                             let users = try decoder.decode([User].self, from: data)
                                self.users = users 
                            //decoding user data from json in an array of users
                            } catch {
                                print(error.localizedDescription)
                            }
                           
                            
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
