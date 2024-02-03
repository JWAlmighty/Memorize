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
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text("🐶").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.orange)
            }
        })
        .onTapGesture(perform: {
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        })
    }
}


#Preview {
    ContentView()
}
