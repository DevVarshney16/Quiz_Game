//
//  ContentView.swift
//  QuizGame
//
//  Created by Dev Varshney on 04/06/25.
//

import SwiftUI

struct Question {
    let question: String
    let choices: [String]
    let answer: String
}

struct ContentView: View {
    @State private var questions = [
        Question(question: "What is the capital of France?", choices: ["Paris", "London", "Berlin", "Madrid"], answer: "Paris"),
        Question(question: "Which planet is known as the Red Planet?", choices: ["Earth", "Mars", "Jupiter", "Venus"], answer: "Mars"),
        Question(question: "Who wrote 'Hamlet'?", choices: ["Dickens", "Shakespeare", "Tolstoy", "Twain"], answer: "Shakespeare"),
        Question(question: "Biggboss Season 20 Winner Name?", choices: ["Rahul","Deepak", "Siddharth", "Pankaj"], answer: "Siddharth"),
        Question(question: "What type of food Are Unhealthy?", choices: ["Chinese", "Oats", "Daalchawal", "Bread"], answer: "Chinese")
    ]
    
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showResult = false

    var body: some View {
        VStack(spacing: 20) {
            if showResult {
                Text("Quiz Finished!")
                    .font(.largeTitle)
                Text("Your Score: \(score)/\(questions.count)")
                    .font(.title2)
                Button("Restart") {
                    currentQuestion = 0
                    score = 0
                    showResult = false
                }
            } else {
                Text(questions[currentQuestion].question)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                ForEach(questions[currentQuestion].choices, id: \.self) { choice in
                    Button(action: {
                        checkAnswer(choice)
                    }) {
                        Text(choice)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
        .frame(width: 400, height: 400)
    }
    
    func checkAnswer(_ selected: String) {
        if selected == questions[currentQuestion].answer {
            score += 1
        }
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
        } else {
            showResult = true
        }
    }
}

#Preview {
    ContentView()
}
