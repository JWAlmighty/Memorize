//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/4/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["😘",  "🤣", "🙈", "👍", "🐶", "🦾",  "👆", "🖖", "🖐️"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 2){ pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }
            else{
                return "🖕"
            }
        }
    }
        
    @Published private var model = createMemoryGame()

    var cards: Array<Card>{
        return model.cards
    }
    
    // MARK: - Intents
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
