//
//  Game.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/18/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

enum GameState {
    case inProgress
    case tied
    case won
}

class Game {
    let playerOne: Player
    let playerTwo: Player
    var board = Board()
    var currentPlayer: Player
    var state: GameState = .inProgress

    init?(playerOne: Player, playerTwo: Player) {
        guard playerOne.mark != playerTwo.mark else {
            return nil
        }
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.currentPlayer = playerOne
    }

    func play(at coordinate: Coordinate) -> String {
        guard isCoordinateValid(coordinate)
            && canPlay(at: coordinate)
            && state == .inProgress else {
                return board.visualRepresentation
        }

        board[coordinate] = currentPlayer.mark

        updateState()

        updateCurrentPlayer()

        return visualRepresentation
    }

    func reset() {
        state = .inProgress
        board = Board()
        currentPlayer = playerOne
    }

    private func canPlay(at coordinate: Coordinate) -> Bool {
        return board.mark(at: coordinate) == nil
    }

    private func isCoordinateValid(coordinate: Coordinate) -> Bool {
        return coordinate.row >= 0
            && coordinate.column >= 0
            && coordinate.row < board.size
            && coordinate.column < board.size
    }

    private func winner() -> Player? {
        for index in 0..<board.size {

            let row = board.row(at: index)

            if let winner = winner(at: row, requiredAmount: board.size) {
                return winner
            }
            let column = board.column(at: index)

            if let winner = winner(at: column, requiredAmount: board.size) {
                return winner
            }
        }

        let topLeftDiagonal = board.diagonal(.topLeftBottomRight)

        if let winner = winner(at: topLeftDiagonal, requiredAmount: board.size) {
            return winner
        }

        let topRightDiagonal = board.diagonal(.topRightBottomLeft)

        if let winner = winner(at: topRightDiagonal, requiredAmount: board.size) {
            return winner
        }

        return nil
    }

    private func winner(at items: [Mark?], requiredAmount: Int) -> Player? {
        //flatMap remueve los valores nulos del arreglo dejando un arreglo del tipo [Mark]
        let flatItems = items.flatMap { $0 }

        guard flatItems.count == requiredAmount else { return nil }

        let players = [playerOne, playerTwo]

        for player in players {

            let marks = flatItems.filter { $0 == player.mark }

            if marks.count == requiredAmount {
                return player
            }
        }
        return nil
    }

    private func updateCurrentPlayer() {
        guard state == .inProgress else {
            return
        }

        if currentPlayer == playerOne {
            currentPlayer = playerTwo
        } else if currentPlayer == playerTwo {
            currentPlayer = playerOne
        }
    }

    private func updateState() {
        if let _ = winner() {
            state = .won
        } else if board.isFull() {
            state = .tied
        }
    }
}

extension Game: VisualRepresentable {
    var visualRepresentation: String {
        let boardVisualRepresentation = board.visualRepresentation
        let playerInformation: String
        if state == .won {
            playerInformation = "\n\(currentPlayer.name) won!"
        } else if state == .tied {
            playerInformation = "\n The game is tied!"
        } else {
            playerInformation = ""
        }
        return boardVisualRepresentation + playerInformation
    }
}
