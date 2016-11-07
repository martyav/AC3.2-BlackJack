//
//  BlackJackViewController.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {
  
  var deck: Deck?
  var deckID: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getDeck(endPoint: "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=6")
  }
  
  func getDeck(endPoint: String) {
    APIRequestManager.manager.getData(endPoint: "\(endPoint)") { (data: Data?) in
      if  let validData = data,
        let validDeck = Deck.deck(from: validData) {
        self.deck = validDeck
        self.deckID = self.deck?.deckID
      }
    }
  }
  
  
   // MARK: - Navigation
   
  
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
   
   }
  
  
}
