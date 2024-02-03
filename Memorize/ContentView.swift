//
//  ContentView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI
// changes
struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 1)
                Text("🐶").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.orange)
            }
        }
    }
}




#Preview {
    ContentView()
}
