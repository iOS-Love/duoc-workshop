//: [Anterior](@previous)

import Foundation

/*:
 ## Array (extra)
 Las colecciones tienen métodos de gran utilidad al momento de querer filtrar/transformar su contenido.
 
 Un ejemplo de eso era `.sort()`, pero existen también otras funciones de para filtrar, como `.filter(...)` o transformar como `.map(...)`, `.flatMap(...)` y `.reduce(...)`
 
 */

let numbers: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

/*:
 ## Filter
 
 Recibe un bloque (closure) que tiene como parametro de entrada el elemento y  retorna un `Bool` indicando si el elemento debe quedarse o ser filtrado
 */


let evenNumbers = numbers.filter { number in
    return number % 2 == 0
}
evenNumbers

let oddNumbers = numbers.filter { $0 % 2 == 1 }
oddNumbers

/*:
 ## Map
 Transforma el contenido elemento por elemento y retorna un arreglo con los elementos transformados en el mismo orden.
 
 Recibe un bloque (closure) que tiene como parametro de entrada el elemento y retorna un nuevo valor (no tiene por que ser el mismo tipo de valor
 */

let sqrts = numbers.map { sqrt(Float($0)) }
sqrts
/*:
 ## FlatMap
 Transforma el contenido elemento por elemento y retorna un arreglo con los elementos transformados en el mismo orden filtrando los valores `nil`.
 Si el arreglo no contiene opcionales y contiene sus elementos son arreglos, unirá los arreglos y creará solo uno.
 
 Recibe un bloque (closure) que tiene como parametro de entrada el elemento y retorna un nuevo valor (no tiene por que ser el mismo tipo de valor
 */

let strings: [String?] = ["Francisco", nil, "Camo", nil, nil, "Workshop"]
let noNilStrings = strings.flatMap { $0?.uppercaseString }
noNilStrings

let characters = [["A","B","C"], ["D","E","F"], ["G","H","I"]]
let result = characters.flatMap { $0 }
result

//: [Siguiente](@next)
