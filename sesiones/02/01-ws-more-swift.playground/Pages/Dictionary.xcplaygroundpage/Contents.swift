//: [Anterior](@previous)

/*:
 # Dictionary
 
 Los diccionarios (Dictionary) también conocidos como "HashMaps" en otros lenguajes nos ayudar a guardar valores en base a una llave.
 
 Los diccionarios no mantienen el orden de los elementos.
 Recuerden. Si es `let` no podrán modificar/agregar valores
 */

var numbers = ["uno": 1, "dos": 2, "tres": 3]
numbers["dos"]
numbers["cuatro"] = 4
numbers["ocho"]


var inverted: [Int: Any] = [1: "uno", 2: "dos", 3: 3]
inverted[1]
inverted[8] = "ocho"

//: [Siguiente](@next)
