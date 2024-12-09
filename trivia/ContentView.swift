//
//  ContentView.swift
//  trivia
//
//  Created by Student on 11/20/24.
//

import SwiftUI


struct ContentView: View {
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    @State private var questions = [
        Question(question: "What is the boiling point of iron?", answers: ["1,518°C", "2,861°C", "3,021°C", "2,891°C"], correctAnswer: 1),
        Question(question: "What is the half-life of Carbon-14?", answers: ["5,370 years", "10,070 years", "1,480 years", "120,450 years"], correctAnswer: 0),
        Question(question: "What is the approximate number of alloys that copper has?", answers: ["50", "100", "200", "400"], correctAnswer: 3),
        Question(question: "Which of these fuels burns the hottest?", answers: ["Methane", "Ethane", "Propane", "Butane"], correctAnswer: 1),
        Question(question: "What is the melting point of vanadium?", answers: ["1,214°F", "3,470°F", "2,891°F", "4,420°F"], correctAnswer: 1),
        Question(question: "At what temperature does carbon dioxide become a solid?", answers: ["-50°C", "-78°C", "-109°C", "-29°C"], correctAnswer: 2),
        Question(question: "What is the atomic number of the element with the symbol 'W'?", answers: ["74", "56", "92", "63"], correctAnswer: 0),
        Question(question: "At what temperature does nitrogen boil at standard pressure?", answers: ["-196°C", "-153°C", "-170°C", "-186°C"], correctAnswer: 0),
        Question(question: "What is the most stable isotope of hydrogen?", answers: ["Deuterium", "Tritium", "Protium", "Hydron"], correctAnswer: 2),
        Question(question: "Which element has the highest thermal conductivity?", answers: ["Diamond", "Copper", "Silver", "Graphene"], correctAnswer: 3),
        Question(question: "What is the half-life of uranium-238?", answers: ["4.5 billion years", "1.1 billion years", "50 million years", "2.8 billion years"], correctAnswer: 0),
        Question(question: "What is the critical temperature of carbon dioxide?", answers: ["31.0°C", "73.8°C", "56.3°C", "50.2°C"], correctAnswer: 0),
        Question(question: "Which of the following compounds has the highest pH?", answers: ["Ammonia", "Sodium hydroxide", "Calcium hydroxide", "Potassium hydroxide"], correctAnswer: 1),
        Question(question: "What is the density of water at 4°C?", answers: ["1.00 g/cm³", "0.92 g/cm³", "0.98 g/cm³", "1.03 g/cm³"], correctAnswer: 0),
        Question(question: "Which molecule has the strongest hydrogen bonding?", answers: ["H2O", "HF", "NH3", "H2S"], correctAnswer: 1),
        Question(question: "What is the electron configuration of an element with atomic number 25?", answers: ["[Ar] 3d5 4s1", "[Ar] 3d4 4s2", "[Ar] 4d5", "[Kr] 5s2 4d7"], correctAnswer: 0),
        Question(question: "What is the ionization energy of helium?", answers: ["24.6 eV", "19.8 eV", "13.6 eV", "8.3 eV"], correctAnswer: 0),
        Question(question: "Which of these elements is a liquid at room temperature?", answers: ["Bromine", "Mercury", "Gallium", "All of the above"], correctAnswer: 3),
        Question(question: "What is the atomic mass of Carbon-14?", answers: ["14.003 g/mol", "14.011 g/mol", "13.999 g/mol", "14.017 g/mol"], correctAnswer: 0),
        Question(question: "Which element has the highest electronegativity?", answers: ["Fluorine", "Oxygen", "Chlorine", "Neon"], correctAnswer: 0),
        Question(question: "What is the most abundant noble gas in Earth's atmosphere?", answers: ["Argon", "Neon", "Helium", "Krypton"], correctAnswer: 0),
        Question(question: "Which metal has the highest melting point?", answers: ["Tungsten", "Ruthenium", "Osmium", "Molybdenum"], correctAnswer: 0),
        Question(question: "What is the standard temperature and pressure (STP) for gas calculations?", answers: ["0°C, 1 atm", "25°C, 1 atm", "273 K, 1 atm", "298 K, 1 atm"], correctAnswer: 0),
        Question(question: "Which element is most commonly used in semiconductor devices?", answers: ["Silicon", "Germanium", "Gallium", "Arsenic"], correctAnswer: 0),
        Question(question: "What is the chemical formula of the mineral pyrite?", answers: ["FeS2", "FeO", "Fe2O3", "CuFeS2"], correctAnswer: 0),
        Question(question: "Which of the following gases has the highest molecular weight?", answers: ["Carbon dioxide (CO2)", "Methane (CH4)", "Nitrogen (N2)", "Oxygen (O2)"], correctAnswer: 0),
        Question(question: "What is the speed of light in a vacuum?", answers: ["3 x 10^8 m/s", "2.5 x 10^8 m/s", "1 x 10^8 m/s", "3 x 10^6 m/s"], correctAnswer: 0),
        Question(question: "Who is credited with the discovery of the electron?", answers: ["J.J. Thomson", "Ernest Rutherford", "Marie Curie", "Albert Einstein"], correctAnswer: 0),
        Question(question: "What is the most stable isotope of uranium?", answers: ["Uranium-238", "Uranium-235", "Uranium-234", "Uranium-233"], correctAnswer: 0),
        Question(question: "What is the chemical symbol for the element with atomic number 74?", answers: ["W", "V", "U", "T"], correctAnswer: 0),
        Question(question: "At what temperature does the triple point of water occur?", answers: ["0.01°C", "0°C", "1°C", "100°C"], correctAnswer: 0),
        Question(question: "What is the wavelength of red light in the visible spectrum?", answers: ["620-750 nm", "450-495 nm", "495-570 nm", "380-450 nm"], correctAnswer: 0),
        Question(question: "Which of the following particles has no charge?", answers: ["Neutron", "Proton", "Electron", "Positron"], correctAnswer: 0),
        Question(question: "What is the chemical formula of sulfuric acid?", answers: ["H2SO4", "H2S", "SO2", "H2O"], correctAnswer: 0)
    ].shuffled()

    
    let correctMessages = ["Good", "Proceed", "Satisfactory", "Decent"]
    let incorrectMessages = ["Womp Womp.", "25% to get it right and you still fumbled", "Wahh wahh wahh.", "GET OUT"]
    @State private var questionIndex = 0
    @State private var score = 0
    @State private var message = ""
    @State private var isAnswered = false
    @State private var isCorrect = true
    @State private var currentColor = Color.white
    @State private var startColor = Color.white
    @State private var endColor = Color.white
    @State private var progress: CGFloat = 0.0
    @State private var isAnimating = false
    @State private var textRotation: Angle = .zero
    @State private var textOffset: CGSize = .zero
    @State private var shakeAmount: CGFloat = 0
    var correctColor: UIColor = .green
     var wrongColor: UIColor = .red



    
    var body: some View {
          ZStack {
              currentColor.ignoresSafeArea()

              VStack(spacing: 20) {
                  Text("Questions that aren't common knowledge")
                      .font(.largeTitle)
                      .bold()

                  // Question Text with shaking animation
                  Text(questions[questionIndex].question)
                      .font(.title2)
                      .multilineTextAlignment(.center)
                      .rotation3DEffect(textRotation, axis: (x: Double.random(in: 0...20), y: Double.random(in: 0...20), z: Double.random(in: 0...20)))
                      .offset(textOffset)
                      .animation(.easeInOut(duration: 0.3), value: textRotation)
                      .animation(.easeInOut(duration: 0.3), value: textOffset)
                      .animation(.easeInOut(duration: 0.3), value: shakeAmount)

                  // Answer Buttons
                  ForEach(0..<4, id: \.self) { index in
                      Button(action: {
                          checkAnswer(selected: index)
                      }) {
                          Text(questions[questionIndex].answers[index])
                              .padding()
                              .frame(maxWidth: .infinity)
                              .background(isAnswered ? isCorrect ? Color.gray : Color.black : Color.blue)
                              .foregroundColor(.white)
                              .cornerRadius(isAnswered ? 5 : 10)
                      }
                      .disabled(isAnswered)
                  }

                  Text(message)
                      .font(.headline)
                      .padding()

                  Text("Score: \(score)")
                      .font(.headline)

                  ProgressBar(progress: CGFloat(questionIndex + 1) / CGFloat(10))
                      .frame(height: 20)
                      .padding()

                  Button(action: nextQuestion) {
                      Text("Next Question")
                          .padding()
                          .background(isAnswered ? Color.green : Color.gray)
                          .foregroundColor(.white)
                          .cornerRadius(8)
                  }
                  .padding()
                  .disabled(!isAnswered)
              }
              .padding()
          }
      }

      struct ProgressBar: View {
          var progress: CGFloat

          var body: some View {
              ZStack(alignment: .leading) {
                  Capsule()
                      .fill(Color.gray.opacity(0.2))
                      .frame(height: 20)
                  Capsule()
                      .fill(Color.blue)
                      .frame(width: progress * 300, height: 20)
              }
          }
      }

      func checkAnswer(selected: Int) {
          let correctAnswer = questions[questionIndex].correctAnswer
          if selected == correctAnswer {
              message = correctMessages.randomElement() ?? "Correct!"
              score += 1
              endColor = Color.green
              startColor = Color.white
              isCorrect = true

          } else {
              message = incorrectMessages.randomElement() ?? "Wrong!"
              score -= 1
              isCorrect = false
              endColor = Color.red
              startColor = Color.white
              shakeAnimation()
             
          }
          isAnswered = true
          isAnimating = true
          startAnimation()
      }

      func shakeAnimation() {
          withAnimation(Animation.default.repeatCount(4, autoreverses: true)) {
              textRotation = .degrees(Double.random(in: -360...360))
              textOffset = CGSize(width: 20, height: 20)
              shakeAmount = 5
          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
              textRotation = .zero
              textOffset = .zero
              shakeAmount = 0
          }
      }

      func nextQuestion() {
          if questionIndex < 10 {
              questionIndex += 1
              message = ""
              isAnswered = false
              isCorrect = false
              textRotation = .zero
              textOffset = .zero
              shakeAmount = 0
              startColor = currentColor
              isAnimating = true

              endColor = Color.white
              startAnimation()
          } else {
              message = "Quiz complete! Your final score is \(score)."
              score = 0
              questionIndex = 0
              isCorrect = false
              textRotation = .zero
              textOffset = .zero
              shakeAmount = 0
              isAnimating = true

              startColor = currentColor
              endColor = Color.purple
              startAnimation()
          }
      }
    func startAnimation() {
          progress = 0.0
          Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
              if progress >= 1.0 || !isAnimating {
                  timer.invalidate()
                  if isAnimating {
                      // Reset animation for the next question
                      progress = 0.0
                      currentColor = endColor
                      isAnimating = false
                  }
              } else {
                  progress += 0.01
                  currentColor = Color.lerp(from: startColor, to: endColor, progress: progress)
              }
          }
      }

  }
extension Color {
    static func lerp(from: Color, to: Color, progress: CGFloat) -> Color {
        let fromComponents = UIColor(from).cgColor.components ?? [0, 0, 0, 1]
        let toComponents = UIColor(to).cgColor.components ?? [0, 0, 0, 1]
        let r = fromComponents[0] + (toComponents[0] - fromComponents[0]) * progress
        let g = fromComponents[1] + (toComponents[1] - fromComponents[1]) * progress
        let b = fromComponents[2] + (toComponents[2] - fromComponents[2]) * progress
        return Color(red: r, green: g, blue: b)
    }
}

  #Preview {
      ContentView()
  }
