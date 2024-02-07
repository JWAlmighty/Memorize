//
//  CardView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/7/24.
//

import SwiftUI

struct CardView: View{
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    
    var body: some View{
        Pie(endAngle: .degrees(260))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1: 0)
        
    }
    
    
    private struct Constants{
        static let cornerRadius: CGFloat = 25
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    VStack{
        CardView(MemoryGame<String>.Card(content: "X", id: "test1"))
            .padding()
            .foregroundColor(.green)
        CardView(MemoryGame<String>.Card(content: "X", id: "test1"))
    }
}