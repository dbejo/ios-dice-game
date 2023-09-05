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
                Rectangle().fill(Color(UIColor.systemFill)).cornerRadius(15)
                if(isPressed) {
                    Image(systemName: "die.face." + String(number)).resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    Text("Let's play!")
                        .foregroundColor(Color.primary)
                        .font(.largeTitle)
                        .bold()
                }
            }
            .padding()
            Button {
                throwDice()
            } label: {
                Text("THROW").foregroundColor(Color.primary)
            }
            .foregroundColor(Color(UIColor.systemBackground))
            .font(.title)
            .bold()
            .padding()
            .background(Rectangle()
                .fill(Color(UIColor.tertiarySystemFill))
                .cornerRadius(15)
                .shadow(radius: 10))
            Spacer()
        }
        .background(Rectangle().fill(Color(UIColor.secondarySystemFill)).ignoresSafeArea())
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
