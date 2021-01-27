//
//  EmojiMemoryGame.swift
//  Consentration
//
//  Created by Orly on 21/01/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // static is not part of the instance of the class so we can use it at any time the class is initiated
    @Published private var model: MemoryGame<String>
    @Published public var theme: Theme

    static func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(theme.numberOfPairsOfCards) { index in
            return theme.emojiSet![index]
        }
    }
    init(){
        //let emojiArray: Array<String> = ["☠️", "🤢", "🤖","😈","👍"]
        // Color.ornage
      //  let theme = Theme(name: "try1", numberOfPairedCard: 4, cardBgColor: (.orange), emojiSet: nil )
        let theme = Theme(name: "try1")

        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme)

    }
    //MARK: access to model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var bgColor: UIColor {
        self.theme.cardBgColor!
    }
    var numberOfPairsOfCards: Int {
        cards.count / 2
    }
    // MARK: - intents
    func choose(card: MemoryGame<String>.Card, index: Int) {
        model.choose(card: card, index: index)
    }
    
    
}
