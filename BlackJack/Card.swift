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

//enum CardValue: Int {
//  case A:
//  case 2,3,4,5,6,7,8,9,10
//  case JACK: 11
//  case QUEEN: 12
//  case KING: 13
//}

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
        else { return nil }
      
      let validCard = Card(image: imageURL, value: cardValue)
      return validCard
    }
      
    catch {
      print("error: \(error)")
    }
    return nil
  }
  
}
