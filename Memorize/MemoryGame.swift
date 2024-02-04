//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/4/24.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
//        cards = Array<Card>()
//        cards = [Card]()
        cards = []
        // add numberOfPairsOfCards * 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
