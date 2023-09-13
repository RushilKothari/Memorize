//
//  ContentView.swift
//  Memorize
//
//  Created by Rushil on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","😈","🕷️"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let base = RoundedRectangle(cornerRadius: 12)
    let content: String
    var body: some View {
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
