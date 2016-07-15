let camo = Player(name: "Camo", mark: .X)
let francisco = Player(name: "Francisco", mark: .O)

let game = Game(playerOne: camo, playerTwo: francisco)

game?.visualRepresentation

game?.gameStatus()

game?.play(at: Coordinate(row: 0, column: 0))
game?.visualRepresentation

game?.play(at: Coordinate(row: 0, column: 1))
game?.visualRepresentation

game?.play(at: Coordinate(row: 1, column: 0))
game?.visualRepresentation

game?.play(at: Coordinate(row: 0, column: 2))
game?.visualRepresentation

game?.play(at: Coordinate(row: 1, column: 1))
game?.play(at: Coordinate(row: 1, column: 2))
game?.visualRepresentation
game?.play(at: Coordinate(row: 2, column: 1))
game?.play(at: Coordinate(row: 2, column: 0))
game?.visualRepresentation

game?.play(at: Coordinate(row: 2, column: 2))
game?.visualRepresentation


game?.gameStatus()
let winner = game?.winner()

game?.play(at: Coordinate(row: 1, column: 1))



