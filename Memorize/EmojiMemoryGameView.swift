//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI

// changes
struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame
//    let emojis: Array<String> = ["😘",  "🤣", "🙈", "👍", "👍"]
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4 
    private let dealAnimation: Animation = .easeInOut(duration: 0.8)
    private let dealInterval: TimeInterval = 0.15
    private let deckWidth: CGFloat = 50

    var body: some View {
        VStack{
            cards
//                .animation(.default, value: viewModel.cards)
                .foregroundColor(viewModel.color)
            HStack{
                score
                Spacer()
                deck.foregroundColor(viewModel.color)
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View{
        Text("Score: \(viewModel.score)")
            .animation(nil)
        
    }
    
    private var shuffle: some View{
        Button("Shuffle"){
            withAnimation{
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View{
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            if isDealt(card){
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1: 0)
                    .onTapGesture{
                        choose(card)
                    }
                
//                    .transition(.offset(
//                        x: CGFloat.random(in: -1000 ... 1000),
//                        y: CGFloat.random(in: -1000 ... 1000)
//                    ))
            }
        }
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool{
        dealt.contains(card.id)
    }
    private var undealtCards: [Card]{
        viewModel.cards.filter{!isDealt($0)}
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View{
        ZStack{
            ForEach(undealtCards){ card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
//                    .transition(.offset(
//                        x: CGFloat.random(in: -1000 ... 1000),
//                        y: CGFloat.random(in: -1000 ... 1000)
//                    ))
            }
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatio)
        .onTapGesture{
            deal()
        }
    }
    
    private func deal(){
        var delay: TimeInterval = 0
        for card in viewModel.cards{
            withAnimation(dealAnimation.delay(delay)){
                _ = dealt.insert(card.id)
            }
            delay += dealInterval
        }
    }
    
    private func choose(_ card: Card){
        withAnimation{
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardID: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardID: "")
    
    private func scoreChange(causedBy card: Card) -> Int{
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
