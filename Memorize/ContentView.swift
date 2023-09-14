//
//  ContentView.swift
//  Memorize
//
//  Created by Rushil on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","😈","🕷️","💀","🕸️","🧙🏻","😱","🍭","👾"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    func cardCountAdjustor(by offset: Int, symbol: String) -> some View {
        Button {
            if cardCount<emojis.count {
                cardCount = cardCount+offset
            }
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
    }
    
    var cardAdder: some View {
        return cardCountAdjustor(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjustor(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
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
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
