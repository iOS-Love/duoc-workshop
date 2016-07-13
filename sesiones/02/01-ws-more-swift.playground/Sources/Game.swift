public class Game {
    public var board = Board()
    let playerOne: Player
    let playerTwo: Player
    var currentPlayer: Player

    public init?(playerOne: Player, playerTwo: Player) {
        guard playerOne.mark != playerTwo.mark else {
            return nil
        }
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        currentPlayer = playerOne
    }

    public var isGameComplete: Bool {
        return board.slots.flatMap { $0 }.flatMap { $0 }.count == 9
    }

    public func isPlayerTurn(player: Player) -> Bool {
        return currentPlayer == player
    }

    public func newGame() {
        board = Board()
    }

    public func canPlaceMark(at coordinate: Coordinate) -> Bool {
        return board[coordinate] == nil
    }

    public func playerOnePlay(atCoordinate coordinate: Coordinate) -> Bool {
        guard play(playerOne, atCoordinate: coordinate) else { return false }
        currentPlayer = playerTwo
        return true
    }

    public func playerTwoPlay(atCoordinate coordinate: Coordinate) -> Bool {
        guard play(playerTwo, atCoordinate: coordinate) else { return false}
        currentPlayer = playerOne
        return true
    }

    private func play(player: Player, atCoordinate coordinate: Coordinate) -> Bool {
        guard isPlayerTurn(player) else { return false }
        guard canPlaceMark(at: coordinate) else { return false }
        guard !isGameComplete else { return false }
        board[coordinate] = player.mark
        return true
    }

    public func boardString() -> String {
        var string = ""
        for row in board.slots {
            for mark in row {
                let rawValue = mark?.rawValue ?? "  "
                string += "[\(rawValue)]"
            }
            string += "\n"
        }
        return string
    }

}

