//
//  ContentView.swift
//  Edutainment
//
//  Created by Hari's Mac on 11.02.2025.
//

import SwiftUI
struct ContentView: View {
    let difficulty = ["Easy","Medium","Hard"]
    @State private var tableNumber = 1
    @State private var tableEnd = 2
    @State private var numberOfProblems = 5
    @State private var finalscore = 0
    @State private var userAnswer = 0
    @State private var firstnumber = 1
    @State private var secondnumber = 1
    @State private var questionNumber = 1
    
    @State private var showalert = false
    @State private var alertmessage = ""
    @State private var alerttitle = ""
    
    var body: some View {
        NavigationStack{
               
                VStack {
                    Form{
                        Section{
                            Text("Multiplication Table").font(.headline)
                            
                            Stepper("From : Table of \(tableNumber.formatted())",value: $tableNumber, in: 2...20, step: 1)
                            Stepper("To : Table of \(tableEnd.formatted())",value: $tableEnd, in: 2...20, step: 1)
                            
                        }
                        Section{
                           // Text("Number of problems")
                            
                            Stepper("Number of Problems :   \(numberOfProblems.formatted())",value: $numberOfProblems, in: 3...15, step: 5)
                            
                        }
                        Section{
                            Text("Problem is :  \(questionNumber)/\(numberOfProblems)")
                        }
                        VStack{
                            Section{
                                Button("Gnerate new "){
                                    scoreCalculator()
                                    triggerAlert()
                                    firstnumber = Int.random(in: tableNumber...tableEnd)
                                    secondnumber = Int.random(in: tableNumber...tableEnd)
                                    if(questionNumber < numberOfProblems){
                                        questionNumber = questionNumber + 1
                                    }
                                }
                            }
                        }
                        .onAppear {
                                    updateRandomNumber()
                                }
                        
                        Section{
                            Text("\(firstnumber) x \(secondnumber)   =    ?? ")
                            TextField("Answer", value: $userAnswer, format: .number)
                        }
                        Section{
                            Text("Score  :  \(finalscore)")
        
                        }
                    }
                    
                    
                  //  .scrollContentBackground(.hidden)
                }
                .navigationTitle("Edutainment")
                 Button("Reset"){
                questionNumber = 1
                finalscore = 0
                 }
                 .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Score"){
                            showalert = true
                        }
                    }
                }
                .alert("Game over", isPresented: $showalert){
                    Button("OK",role:.cancel){}
                }message:{
                    Text("Score \(finalscore)")
                }
            
        }
}
    private func updateRandomNumber() {
           if tableNumber <= tableEnd {
               firstnumber = Int.random(in: tableNumber...tableEnd)
               secondnumber = Int.random(in: tableNumber...tableEnd)
           }
       }
    
    func scoreCalculator(){
        if userAnswer == (firstnumber * secondnumber){
            finalscore = finalscore + 1
        }
    }
    func triggerAlert(){
        if(questionNumber == numberOfProblems){
            showalert = true
        }
    }
}

#Preview {
    ContentView()
}
