public enum Mark: String {
    case X, O
}

public struct Board {
    public var slots: [[Mark?]] = [[nil, nil, nil],
                            [nil, nil, nil],
                            [nil, nil, nil]]

    public func mark(at coordinate: Coordinate) -> Mark? {
        return slots[coordinate.row][coordinate.column]
    }

    public mutating func setMark(mark: Mark?, at coordiante: Coordinate) {
        slots[coordiante.row][coordiante.column] = mark
    }

    subscript(coordinate: Coordinate) -> Mark? {
        get {
            return mark(at: coordinate)
        }
        set {
            setMark(newValue, at: coordinate)
        }
    }
}
