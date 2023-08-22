//
//  ContentView.swift
//  lesson1
//
//  Created by Bejó Dávid on 2023. 08. 22..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var number = 6
    @State var isPressed = false

    var body: some View {
        VStack {
            HStack {
                Text("Throw a dice")
                    .font(.largeTitle)
                Spacer()
            }.padding()
            ZStack{
                Rectangle().fill(colorScheme == .dark ? Color(red: 0.1, green: 0.1, blue: 0.1) : Color(red: 0.93, green: 0.93, blue: 0.93)).cornerRadius(15)
                if(isPressed) {
                    Image(systemName: "die.face." + String(number)).resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    Text("Let's play!")
                        .font(.largeTitle)
                        .bold()
                }
            }
            .padding()
            Button {
                throwDice()
            } label: {
                Text("THROW").foregroundColor(colorScheme == .dark ? .white : .black)
            }
            .foregroundColor(.black)
            .font(.title)
            .bold()
            .padding()
            .background(Rectangle()
                .fill(colorScheme == .dark ? Color(red: 0.05, green: 0.05, blue: 0.05) : Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(15)
                .shadow(radius: 10))
            Spacer()
        }
        .background(Rectangle().fill(colorScheme == .dark ? Color(red: 0.15, green: 0.15, blue: 0.15) : Color(red: 0.9, green: 0.9, blue: 0.9)).ignoresSafeArea())
    }
    
    func throwDice() {
        isPressed = true
        number = Int.random(in: 1...6)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
