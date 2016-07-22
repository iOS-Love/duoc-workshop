//
//  Player.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/18/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

struct Player {
    let name: String
    let mark: Mark
}

extension Player: Equatable { }

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name && lhs.mark == rhs.mark
}
