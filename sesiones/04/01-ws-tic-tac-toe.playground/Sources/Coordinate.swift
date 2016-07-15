public struct Coordinate {
    public let row: Int
    public let column: Int

    public init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
}

extension Coordinate: Equatable { }

public func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.row == rhs.row
        && lhs.column == rhs.column
}
