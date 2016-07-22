//
//  PlayersViewController.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/20/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    @IBOutlet weak var playerOneTextField: UITextField!

    @IBOutlet weak var playerTwoTextField: UITextField!

    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var startButtonHeight: NSLayoutConstraint!

    @IBAction func didPressStartButton(sender: UIButton) {

        performSegueWithIdentifier("show.game", sender: self)
    }

    func textFieldText(textField: UITextField) -> String {
        return textField.text ?? ""
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "show.game" else { return }

        guard let gameViewController = segue.destinationViewController as? GameViewController else {
            return
        }

        let playerOneName = textFieldText(playerOneTextField)
        let playerTwoName = textFieldText(playerTwoTextField)
        let playerOne = Player(name: playerOneName, mark: .O)
        let playerTwo = Player(name: playerTwoName, mark: .X)

        gameViewController.playerOne = playerOne
        gameViewController.playerTwo = playerTwo
    }

    @IBAction func dismissGame(segue: UIStoryboardSegue) {
        playerOneTextField.text = ""
        playerTwoTextField.text = ""
    }
}
