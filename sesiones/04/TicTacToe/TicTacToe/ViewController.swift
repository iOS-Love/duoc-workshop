//
//  ViewController.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/18/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!

    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!

    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!

    var buttons: [[UIButton]] {
        return [[button00, button01, button02],
                [button10, button11, button12],
                [button20, button21, button22]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        // Iniciar juego con jugadores
        
    }

    func resetBoard() {
        buttons.flatMap { $0 }.forEach { button in
            button.setTitle("", forState: .Normal)
        }
    }

    @IBAction func didPressButton(button: UIButton) {
        button.setTitle("O", forState: .Normal)

        // Detectar la coordada de botón
        // Agregar jugada a la coordenada
        // Cambiare el Game().Play para que retorne un Bool
        //  - Si es que se pudo jugar.
        //  - Si se pudo jugar, entonces actualizar el botón
    }
}
