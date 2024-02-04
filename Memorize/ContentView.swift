//
//  ContentView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI

// changes
struct ContentView: View {
//    let emojis: Array<String> = ["😘",  "🤣", "🙈", "👍", "👍"]
    let emojis = ["😘",  "🤣", "🙈", "👍", "👍", "🐶", "🦾", "🖕"]
    
    var body: some View {
        ScrollView{
            cards
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
}

struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 25.0)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
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
