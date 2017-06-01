//
//  Store.swift
//  TicTacToeClassic
//
//  Created by Mariano Patafio on 01/06/2017.
//  Copyright © 2017 Benjamin Encz. All rights reserved.
//

import Foundation



protocol Store
{
    func handle(action: Action)
}


class TicTacToeStore: Store
{
    var state: State!
    func handle(action: Action)  {
        switch action
        {
        case let action as UserTapAction:
            attempt(atIndex: action.index)
        default:
            break
        }
        
    }
    
    private func attempt(atIndex: Int){
       if(self.state.game.attemptPlacing(atIndex: atIndex))
       {
        if let winner = state.game.winner {
            state.instruction = "\(winner) won!"
        }
        else{
            state.instruction = "\(state.game.currentPlayer) moves now"
        }
       }
       else
       {
        state.instruction = "Invalid place, try again"
      }
    }
}
