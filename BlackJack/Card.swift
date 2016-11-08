//
//  Card.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import Foundation

enum CardParseError: Error {
  case response, image, value
}

enum CardValue: String {
  case Ace = "ACE"
  case Two = "2"
  case Three = "3"
  case Four = "4"
  case Five = "5"
  case Six = "6"
  case Seven = "7"
  case Eight = "8"
  case Nine = "9"
  case Ten = "10"
  case Jack = "JACK"
  case Queen = "QUEEN"
  case King = "KING"
}

enum IntValue: Int {
  case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

class Card {
  internal let image: String
  internal let value: String
  
  init(image: String, value: String) {
    self.image = image
    self.value = value
  }
  
  static func cards(from data: Data) -> Card? {
    
    do {
      let jsonData: Any = try JSONSerialization.jsonObject(with: data, options: [])
      
      guard let response = jsonData as? [String: Any]
        else {
          print("response json error")
          throw CardParseError.response
      }
      
      guard let cards = response["cards"] as? [[String: Any]],
        cards.count > 0,
        let imageURL = cards[0]["image"] as? String,
        let cardValue = cards[0]["value"] as? String
        else {
          print("test")
          throw CardParseError.value }
      
      let convertCard = CardValue(rawValue: cardValue)
      let convertCardToInt = IntValue.convertCard.rawValue
      
      let validCard = Card(image: imageURL, value: cardValue)
      return validCard
    }
      
    catch {
      print("error: \(error)")
    }
    return nil
  }
  
}
