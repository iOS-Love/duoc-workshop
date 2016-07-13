public struct Coordinate {
    public let row: Int
    public let column: Int
}

extension Coordinate: Equatable { }

public func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.row == rhs.row
        && lhs.column == rhs.column
}