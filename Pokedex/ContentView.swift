//
//  ContentView.swift
//  Pokedex
//
//  Created by Jasper Limenzon on 26/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchText == "" ? pokemon: pokemon.filter( {$0.name.contains(searchText.lowercased())} )) {
                    entry in
                    Text("\(entry.name)".capitalized)
                    
                }
            }
            
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
