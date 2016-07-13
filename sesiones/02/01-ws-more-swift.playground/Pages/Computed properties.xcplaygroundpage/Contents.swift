//: [Anterior](@previous)

/*:
 # Computed Properties

 Además de tener stored properties, un tipo puede obtener computed properties, las que no guardan el valor, sino que lo computan.


 ## Sintaxis:
 */

struct Point {
    var x: Double
    var y: Double
}

struct Size {
    var width: Double
    var height: Double
}

struct Rect {
    var origin: Point
    var size: Size

    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//: [Siguiente](@next)
