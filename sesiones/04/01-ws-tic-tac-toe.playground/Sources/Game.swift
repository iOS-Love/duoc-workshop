public enum GameStatus {
    case inProgress, won, tied
}

public class Game {
    private var board = Board()
    private let playerOne: Player
    private let playerTwo: Player
    private var currentPlayer: Player

    public init?(playerOne: Player, playerTwo: Player) {
        guard playerOne.mark != playerTwo.mark else {
            return nil
        }
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        currentPlayer = playerOne
    }

    public func play(at coordinate: Coordinate) -> Bool {
        guard canPlaceMark(at: coordinate) else { return false }
        guard gameStatus() == .inProgress else { return false }
        board[coordinate] = currentPlayer.mark
        currentPlayer = currentPlayer == playerOne ? playerTwo : playerOne
        return true
    }

    public func gameStatus() -> GameStatus {
        if winner() != nil {
            return .won
        } else if isBoardTied() {
            return .tied
        } else {
            return .inProgress
        }
    }

    public func reset() {
        board = Board()
        currentPlayer = playerOne
    }

    public func winner() -> Player? {
        
        let rowsCount = board.slots.count

        // Check diagonals
        let leftDiagonal = board.diagonal(with: .leftToRight)
        if let winner = winner(in: leftDiagonal, amountNeeded: rowsCount) {
            return winner
        }
        
        let rightDiagonal = board.diagonal(with: .rightToLeft)
        if let winner = winner(in: rightDiagonal, amountNeeded: rowsCount) {
            return winner
        }
        
        for index in 0..<rowsCount {
            // Check rows
            let row = board.row(at: index)
            if let winner = winner(in: row, amountNeeded: rowsCount) {
                return winner
            }

            // Check columns
            let column = board.column(at: index)
            if let winner = winner(in: column, amountNeeded: rowsCount) {
                return winner
            }
        }

        return nil
    }

    private func winner(in marks: [Mark?], amountNeeded: Int) -> Player? {
        let flattedMarks = marks.flatMap { $0 }
        guard flattedMarks.count == amountNeeded else { return nil }

        let markOne = flattedMarks.filter { $0 == .O }
        if markOne.count == amountNeeded {
            return player(with: .O)
        }

        let markTwo = flattedMarks.filter { $0 == .X }
        if markTwo.count == amountNeeded {
            return player(with: .X)
        }

        return nil
    }
}

// MARK: Board Actions
private extension Game {
    func isBoardFull() -> Bool {
        let allSlots = board.slots.flatMap { $0 }
        let usedSlots = allSlots.filter { $0 != nil }
        return usedSlots.count == allSlots.count
    }

    func isBoardTied() -> Bool {
        guard winner() == nil else { return false }
        return isBoardFull()
    }
}

// MARK: Player Actions
private extension Game {
    func canPlaceMark(at coordinate: Coordinate) -> Bool {
        guard coordinate.row < board.slots.count else { return false }
        guard coordinate.column < board.row(at: coordinate.row).count else { return false }
        return board[coordinate] == nil
    }

    func player(with mark: Mark) -> Player {
        return playerOne.mark == mark ? playerOne : playerTwo
    }
}

// MARK: VisualRepresentable
extension Game: VisualRepresentable {
    public var visualRepresentation: String {
        let firstLine = board.visualRepresentation
        guard gameStatus() != .inProgress else {
            return firstLine
        }

        let secondLine: String
        if let player = winner() {
            secondLine = "\nWinner is: \(player.name)"
            return firstLine + secondLine
        } else {
            secondLine = "\nIt's a tie!"
        }

        return firstLine + secondLine
    }
}
