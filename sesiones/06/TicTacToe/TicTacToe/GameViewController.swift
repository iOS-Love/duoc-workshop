//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/18/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!

    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!

    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var buttons: [[UIButton]] {
        return [[button00, button01, button02],
                [button10, button11, button12],
                [button20, button21, button22]]
    }
    
    var playerOne: Player!
    var playerTwo: Player!
    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        createGame()
        resetGame()
    }

    func createGame() {
        // Iniciar juego con jugadores
        game = Game(playerOne: playerOne, playerTwo: playerTwo)
    }

    func resetGame() {
        restartButton.hidden = true
        newGameButton.hidden = true
        titleLabel.text = "Bienvenido"
        buttons.flatMap { $0 }.forEach { button in
            button.setTitle("", forState: .Normal)
        }
        game?.reset()
    }

    @IBAction func didPressResetButton() {
        resetGame()
    }

    @IBAction func didPressNewGameButton() {
        performSegueWithIdentifier("new.game", sender: self)
    }

    @IBAction func didPressButton(button: UIButton) {
        for (rowIndex, row) in buttons.enumerate() {
            for (columnIndex, currentButton) in row.enumerate() {
                guard button === currentButton else { continue }

                let coordinate = Coordinate(row: rowIndex, column: columnIndex)

                guard let mark = game?.play(at: coordinate) else {
                    return
                }
                updateButton(currentButton, with: mark)
                updateTitle()
                updateControlButtons()
                return
            }
        }
    }

    func updateButton(button: UIButton, with mark: Mark) {
        button.setTitle(mark.rawValue, forState: .Normal)
    }

    func updateTitle() {
        guard let state = game?.state else {
            titleLabel.text = ""
            return
        }

        let playerInformation: String
        switch state {
        case .won:
            let name = game?.winner?.name ?? "Somebody"
            playerInformation = "\(name) won!"
        case .tied:
            playerInformation = "The game is tied!"
        case .inProgress:
            playerInformation = "In progress"
        }

        titleLabel.text = playerInformation
    }

    func updateControlButtons() {
        restartButton.hidden = game?.state == .inProgress
        newGameButton.hidden = restartButton.hidden
    }
}
