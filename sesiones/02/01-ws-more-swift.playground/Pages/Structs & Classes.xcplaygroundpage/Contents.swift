//: [Anterior](@previous)

/*:
 # Classes & Structures
 - Tienen propiedades para guardar valores
 - Pueden tener métodos que agregan funcionalidad
 - inicializadores con valores/estados iniciales
 - Pueden ser extendidos para agregar funcionalidad por defecto
 - Pueden conformar protocol
 
 ## Classes
 - Permiten heredar de otra clase
 - Son referencias, se pueden acceder de mas de un solo lugar a una misma instancia.
 - Si las variables no tienen valores por defecto se necesita crear un `init(...`
 */

//class Point {
//    var x: Float
//    var y: Float
//    
//    init(x: Float, y: Float) {
//        self.x = x
//        self.y = y
//    }
//}

struct Point {
    var x: Float
    var y: Float
}

class View {
    var position: Point
    
    init(position: Point) {
        self.position = position
    }
}

var position = Point(x: 10, y: 20)
let view = View(position: position)
view.position
position.x = -50
view.position


class Workshop {
    private var rsvp: [String?] = [nil, nil, nil,
                                   "Jaime", nil, nil,
                                   nil, "Camo", nil,
                                   nil, nil, "Francisco"]
    
    func setAttendee(attendee: String, atIndex index: Int) {
        rsvp[index] = attendee
    }
    
    func attendees() -> [String] {
        return rsvp.flatMap { $0 }.sort().map { $0.uppercaseString }
    }
}


let ws = Workshop()
ws.setAttendee("Pepe", atIndex: 0)

ws.attendees()


//: [Siguiente](@next)
