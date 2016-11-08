//
//  Deck.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import Foundation

enum DeckParseError: Error {
  case response, deckID
}

class Deck {
  internal let deckID: String
  
  init(deckID: String) {
    self.deckID = deckID
  }
  
  static func deck(from data: Data) -> Deck? {
    
    do {
      let jsonData: Any = try JSONSerialization.jsonObject(with: data, options: [])
      
      guard let response = jsonData as? [String: Any]
        else { throw DeckParseError.response }
      
      guard let deckID = response["deck_id"] as? String
        else { throw DeckParseError.deckID }
      
      let validDeck = Deck(deckID: deckID)
      return validDeck
    }
    catch {
      print("error: \(error)")
    }
    return nil
  }
  
}
