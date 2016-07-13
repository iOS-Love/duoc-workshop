public struct Player {
    public let name: String
    public let mark: Mark

    public init(name: String, mark: Mark) {
        self.name = name
        self.mark = mark
    }
}

public func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name &&
        lhs.mark == rhs.mark
}
