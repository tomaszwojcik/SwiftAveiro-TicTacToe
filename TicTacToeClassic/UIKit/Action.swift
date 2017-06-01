//
//  Action.swift
//  TicTacToeClassic
//
//  Created by Tomasz Wójcik on 01/06/2017.
//  Copyright © 2017 Benjamin Encz. All rights reserved.
//

import Foundation

protocol Action {
}

struct UserTapAction: Action {
    let index: Int
}
