//
//  ContentView.swift
//  RPS
//
//  Created by Gennady Raster on 5.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameItems = ["Rock", "Paper", "Scissors"]
    
    private var aiChoise: String {
        get{
            gameItems.shuffled()[0]
        }
    }
    
    @State private var winOrLose = ["Win", "Lose"].shuffled()
    
    @State private var playerChoise = "Rock"
    
    @State private var showAnswer = false
    
    @State private var round = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    // AI select
                    Section{
                        HStack{
                            Text(aiChoise)
                            Text(winOrLose[0])
                        }
                    } header: {
                        Text("AI need:")
                        
                    }
                    
                    Spacer()
                    
                    // Player select
                    Section{
                        VStack{
                            
                        }
                    } header: {
                        Text("Your choise:")
                        
                    }
                    Picker("Player Choise", selection: $playerChoise){
                        ForEach(gameItems, id: \.self){ item in
                            Text(item)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Button{
                        showAnswer = true
                    } label: {
                        Label("Submit", systemImage: "checkmark")
                            
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .navigationTitle("Rock.Paper.Scissors")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
