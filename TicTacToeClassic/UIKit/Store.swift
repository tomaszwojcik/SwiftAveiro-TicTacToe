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
    var delegate: StoreDelegate { get }
    func handle(action: Action)
}

protocol StoreDelegate {
    func onStore(event: State)
}

class TicTacToeStore: Store
{
    var state: State {
        didSet {
            delegate.onStore(event: state)
        }
    }
    var delegate: StoreDelegate {
        didSet {
            delegate.onStore(event: state)
        }
    }

    init(delegate: StoreDelegate, game: Game) {
        let instruction = game.currentPlayer == .x ? "Your move, x" : "Your move, o"
        state = State(game: game, instruction: instruction)
        self.delegate = delegate
        delegate.onStore(event: state)
    }

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
        delegate.onStore(event: state)
    }
}
