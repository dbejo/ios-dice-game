//
//  ContentView.swift
//  lesson1
//
//  Created by Bejó Dávid on 2023. 08. 22..
//

import SwiftUI

struct ContentView: View {
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
                Rectangle().fill(.white)
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
                Text("THROW")
            }
            .foregroundColor(.black)
            .font(.title)
            .bold()
            .padding()
            .background(Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(radius: 10))
            Spacer()
        }
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
