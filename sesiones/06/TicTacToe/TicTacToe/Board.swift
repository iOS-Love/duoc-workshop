//
//  Board.swift
//  TicTacToe
//
//  Created by Camilo Vera Bezmalinovic on 7/18/16.
//  Copyright © 2016 Camilo Vera Bezmalinovic. All rights reserved.
//

enum Diagonal {
    case topLeftBottomRight
    case topRightBottomLeft
}

struct Board {
    let size: Int
    private var items: [[Mark?]]

    init(size: Int = 3) {
        self.size = size
        let row: [Mark?] = Array(count: size, repeatedValue: nil)
        items = Array(count: size, repeatedValue: row)
    }

    subscript(coordinate: Coordinate) -> Mark? {
        set { setMark(newValue, at: coordinate) }
        get { return mark(at: coordinate) }
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
        return items.map { $0[index] }
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

    func isFull() -> Bool {
        let flattedBoard = items.flatMap { $0 }
        let nilMarks = flattedBoard.filter { $0 == nil }

        return nilMarks.count == 0
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
