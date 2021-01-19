
import Foundation

class Concentration {
 
    var cards = [Card]()
    
    ///
    /// Handle what to do when a card is chosen
    ///
    func chooseCard(at index: Int) {
        
        // Process an unmatched card
        if !cards[index].isMatched {
            
            // If we have a card facing up already, check if it matches the chosen one
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // If they match, marked them as matched
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                // Turn the chosen card face-up
                cards[index].isFaceUp = true
                
                // Since there was a card face-up already (and we selected a new one),
                // we no longer have only 1 card face-up
                indexOfOneAndOnlyFaceUpCard = nil
            }
            // We don't have oneAndOnly cards up
            else {
                
                // Either two cards or no cards are face up
                
                // Flip them all down to be safe
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                // Now turn the selected one face-up
                cards[index].isFaceUp = true
                
                // We now have only 1 card face-up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //MARK: orly
    ///
    /// Build a Concentration game based on the given number of card-pairs
    ///
    init(numberOfPairsOfCards: Int) {
        
        // Create each card in the game
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            if cards.count > 0 {
                var randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
                cards.insert(card, at: randomIndex)
                randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
                cards.insert(card, at: randomIndex)
            } else {
                cards.append(card)
                cards.append(card)
            }

        }
        
    }
    
    ///
    /// Whether or not we have ONLY one card face-up
    ///
    var indexOfOneAndOnlyFaceUpCard: Int?
}
