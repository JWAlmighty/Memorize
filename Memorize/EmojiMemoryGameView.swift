//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI

// changes
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
//    let emojis: Array<String> = ["😘",  "🤣", "🙈", "👍", "👍"]
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4 

    var body: some View {
        VStack{
            cards
                .animation(.default, value: viewModel.cards)
                .foregroundColor(.orange)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    private var cards: some View{
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CardView(card)
                .padding(4)
                .onTapGesture{
                    viewModel.choose(card)
                }
        }
        
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
