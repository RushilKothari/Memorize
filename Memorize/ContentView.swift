//
//  ContentView.swift
//  Memorize
//
//  Created by Rushil on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
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
    var isFaceUp: Bool = false
    let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
    var body: some View {
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
    }
}
