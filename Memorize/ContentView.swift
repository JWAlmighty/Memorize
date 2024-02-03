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
    let emojis = ["😘",  "🤣", "🙈", "👍", "👍"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
    var cardCountAdjuster: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjust(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    
    var cardRemover: some View{
        cardCountAdjust(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View{
        cardCountAdjust(by: 1, symbol: "rectangle.stack.badge.plus.fill")
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
