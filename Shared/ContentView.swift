//
//  ContentView.swift
//  Shared
//
//  Created by Gabriel Reimers on 20.04.22.
//

import SwiftUI
import os

struct ContentView: View {
    @State private var joke: Joke?
    private let log = Logger(subsystem: "com.coding-friends.oslog-sample", category: "ContentView")

    let session = URLSession(configuration: .ephemeral)
    var body: some View {
        Text(joke?.value ?? "Not funny")
            .lineLimit(5)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .padding()
            .frame(maxWidth: 400)
        
        Button {
            Task {
                log.notice("Loading joke started")
                
                let (data, _) = try await session.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                let decodedResponse = try JSONDecoder().decode(Joke.self, from: data)
                joke = decodedResponse
                
                log.notice("Loading joke completed")

            }
        } label: {
            Text("Fetch Joke")
        }
        
        Button {
            joke?.gabify()
        } label: {
            Text("Gabify")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
