//
//  ContentView.swift
//  RPS
//
//  Created by Gennady Raster on 5.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameItems = ["Rock", "Paper", "Scissors"]
    
    private var aiChoise: (item: String, winOrLose: String) {
        
        return (item: gameItems.randomElement()!, winOrLose: ["Win", "Lose"].randomElement()!)
        
    }
    
    @State private var winOrLose = ["Win", "Lose"].randomElement()!
    
    @State private var playerChoise = "Rock"
    
    @State private var showAnswer = false
    
    @State private var round = 0
    
    @State private var score = (ai: 0, player: 0)
    
    @State private var message = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    // AI select
                    
                    Spacer()
                    Section{
                        HStack{
                            Text(aiChoise.item)
                            Spacer()
                            Text("You need to \(aiChoise.winOrLose)")
                        }
                    } header: {
                        Text("AI choise:")
                        
                    }
                    
                    Spacer()
                    Text("Round: \(round)")
                    Spacer()
                    
                    // Player select
                    Section{
                        VStack{
                            
                            Picker("Player Choise", selection: $playerChoise){
                                ForEach(gameItems, id: \.self){ item in
                                    Text(item)
                                    
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Button{
                                checkAnswer()
                            } label: {
                                Label("Submit", systemImage: "checkmark")
                                    
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .alert(message, isPresented: $showAnswer){
                                Button("OK", role: .cancel){}
                            }
                            
                        }
                    } header: {
                        Text("Your choise:")
                        
                    }
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("Rock.Paper.Scissors")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func matchesItems(player: String, ai: (item: String, winOrLose: String)) -> Bool {
        
        switch (player, ai.item, ai.winOrLose){
            
        case ("Rock", "Paper", "Win"):
            return false
        case ("Rock", "Paper", "Lose"):
            return true
        case ("Scissors", "Paper", "Win"):
            return true
        case ("Scissors", "Paper", "Lose"):
            return false
        case ("Scissors", "Rock", "Win"):
            return false
        case ("Scissors", "Rock", "Lose"):
            return true
        
        default:
            return false
        }
        
        
        
    }
    
    func checkAnswer(){
        
        round += 1
        
        
        if matchesItems(player: playerChoise, ai: aiChoise) {
            score.player += 1
            message = "Player WIN"
        } else {
            score.ai += 1
            message = "Player LOSE"
        }
        
        
        
        
        if round < 11 {
            showAnswer = true
        } else {
            round = 0
            score.player = 0
            score.ai = 0
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
