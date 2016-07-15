//:  [https://github.com/iOS-Love](https://github.com/iOS-Love)
enum Diagonal {
    case topLeftBottomRight
    case topRightBottomLeft
}

enum Mark: String {
    case X
    case O
}

struct Player {
    let name: String
    let mark: Mark
}

extension Player: Equatable { }

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name && lhs.mark == rhs.mark
}

struct Coordinate {
    let row: Int
    let column: Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
}


protocol VisualRepresentable {
    var visualRepresentation: String { get }
}

struct Board {
    let size: Int
    private var items: [[Mark?]]
    
    init(size: Int = 3) {
        self.size = size
        let row: [Mark?] = Array(count: size, repeatedValue: nil)
        items = Array(count: size, repeatedValue: row)
    }
    
    //Nos permite acceder a las marcas como si el tablero fuera un arreglo o diccionario utilizando como llave una coordinada
    //Game().board[Coordinate(row: 0, column: 0)]
    subscript(coordinate: Coordinate) -> Mark? {
        set {
            setMark(newValue, at: coordinate)
        }
        get {
            return mark(at: coordinate)
        }
    }
    
    mutating func setMark(mark: Mark?, at coordinate: Coordinate) {
        items[coordinate.row][coordinate.column] = mark
    }
    
    func mark(at coordinate: Coordinate) -> Mark? {
        return items[coordinate.row][coordinate.column]
    }
    
    func row(at index: Int) -> [Mark?] {
        return items[index]
    }
    
    func column(at index: Int) -> [Mark?] {
        var columns: [Mark?] = []
        for row in items {
            let mark = row[index]
            columns.append(mark)
        }
        return columns
        //return items.map { $0[index] }
    }
    
    func diagonal(diagonal: Diagonal) -> [Mark?] {
        var diagonalItems: [Mark?] = []
        for index in 0..<size {
            let column: Int
            if diagonal == .topLeftBottomRight {
                column = index
            } else {
                column = size - index - 1
            }
            let mark = items[index][column]
            diagonalItems.append(mark)
        }
        return diagonalItems
    }
}

extension Board: VisualRepresentable {
    var visualRepresentation: String {
        var string = ""
        for row in items {
            for mark in row {
                if let stringMark = mark?.rawValue {
                    string += "[\(stringMark)]"
                } else {
                    string += "[  ]"
                }
            }
            string += "\n"
        }
        return string
    }
}

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
            && canPlay(at: coordinate) else {
            return board.visualRepresentation
        }
        board.setMark(currentPlayer.mark, at: coordinate)

        if currentPlayer == playerOne {
            currentPlayer = playerTwo
        } else if currentPlayer == playerTwo {
            currentPlayer = playerOne
        }

        return board.visualRepresentation
    }
    
    func canPlay(at coordinate: Coordinate) -> Bool {
        return board.mark(at: coordinate) == nil
    }
    
    func isCoordinateValid(coordinate: Coordinate) -> Bool {
        return coordinate.row >= 0
            && coordinate.column >= 0
            && coordinate.row < board.size
            && coordinate.column < board.size
    }
    
    func winner() -> Player? {
        for index in 0..<board.size {
            
            let row = board.row(at: index)
            
            if let winner = winner(in: row, requiredAmount: board.size) {
                return winner
            }
            let column = board.column(at: index)

            if let winner = winner(in: column, requiredAmount: board.size) {
                return winner
            }
        }
        
        let topLeftDiagonal = board.diagonal(.topLeftBottomRight)
        
        if let winner = winner(in: topLeftDiagonal, requiredAmount: board.size) {
            return winner
        }
        
        let topRightDiagonal = board.diagonal(.topRightBottomLeft)
        
        if let winner = winner(in: topRightDiagonal, requiredAmount: board.size) {
            return winner
        }
        
        return nil
    }
    
    func winner(in items: [Mark?], requiredAmount: Int) -> Player? {
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

}

extension Game: VisualRepresentable {
    var visualRepresentation: String {
        return board.visualRepresentation
    }
}

let camo = Player(name: "Camo", mark: .O)
let francisco = Player(name: "Francisco", mark: .X)
let game = Game(playerOne: camo, playerTwo: francisco)

game?.play(at: Coordinate(row: 1, column: 1))

game?.play(at: Coordinate(row: 0, column: 1))
game?.play(at: Coordinate(row: 2, column: 1))
game?.play(at: Coordinate(row: 0, column: 0))
game?.play(at: Coordinate(row: 0, column: 2))
game?.play(at: Coordinate(row: 1, column: 0))
game?.play(at: Coordinate(row: 2, column: 0))
game?.play(at: Coordinate(row: 1, column: 2))
game?.play(at: Coordinate(row: 2, column: 2))

//: # Tarea
//: - Actualizar el estado del juego (.inProgress, .won, .tied)
//: - En la representación visual mostrar si un jugador ganó o fue un empate
//: - Si el juego se ganó, no se debe permitir agregar mas valores.
//: - Crear una función para reiniciar el juego

