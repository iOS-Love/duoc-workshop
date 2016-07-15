enum Direction {
    case leftToRight, rightToLeft
}

struct Board {
    private(set) var slots: [[Mark?]]

    init(size: Int = 3) {
        let row: [Mark?] = Array(count: size, repeatedValue: nil)
        slots = Array(count: size, repeatedValue: row)
    }

    subscript(coordinate: Coordinate) -> Mark? {
        get {
            return mark(at: coordinate)
        }
        set {
            setMark(newValue, at: coordinate)
        }
    }

    func column(at index: Int) -> [Mark?] {
        var column: [Mark?] = []

        for row in slots {
            column.append(row[index])
        }
        
        return column
        //return slots.map { $0[index] }
    }

    func row(at index: Int) -> [Mark?] {
        return slots[index]
    }

    func diagonal(with direction: Direction) -> [Mark?] {
        var diagonal: [Mark?] = []

        let lastIndex = slots.count - 1
        for index in 0...lastIndex {
            let coordinate = direction == .leftToRight ? Coordinate(row: index, column: index) : Coordinate(row: index, column: lastIndex - index )
            diagonal.append(self[coordinate])
        }
        return diagonal
    }
}

private extension Board {
    func mark(at coordinate: Coordinate) -> Mark? {
        return slots[coordinate.row][coordinate.column]
    }

    mutating func setMark(mark: Mark?, at coordiante: Coordinate) {
        slots[coordiante.row][coordiante.column] = mark
    }
}

extension Board: VisualRepresentable {
    var visualRepresentation: String {
        var representation = ""
        for row in slots {
            for mark in row {
                let rawValue = mark?.rawValue ?? "  "
                representation += "[\(rawValue)]"
            }
            representation += "\n"
        }
        return representation
    }
}
