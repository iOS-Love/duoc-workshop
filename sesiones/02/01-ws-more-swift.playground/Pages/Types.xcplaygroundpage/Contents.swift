//: [Anterior](@previous)

/*:
 # Types
 
 No siempre es necesario especificar el tipo de la variable. Si este no puede ser inferido o el valor se le asignará después es necesario hacerlo.
 
 Para eso luego del nombre de la variable agregamos "dos puntos" y el tipo de variable.
 
 */
import Foundation

let integer: Int = 0
let double: Double = 3.14
let float: Float = sqrt(2)
let string: String = "texto"


let text = "hola mundo"
var otherText: String?
otherText = "el mundo te saluda"

//var marks = [nil,"A","B"]
var marks: [String?] = [nil, "A", "B"]

var someNumber = 0.5

func pow2(number: Float) -> Float {
    return pow(number, 2)
}


/*:
 ## Enums
 
 Los enums nos sirven para representar algún estado, cuando este es conocido y acotado.
 
 También pueden tener un tipo asociado.
 
 */

enum Marca: String {
    case subaru
    case dodge
    case toyota
    case audi
}

let marca = Marca.toyota

switch marca {
case .subaru:
    print("es un subaru")
case .dodge:
    print("un dodge")
case .audi, .toyota:
    print("es un auto")
}

marca.rawValue


//: [Siguiente](@next)
