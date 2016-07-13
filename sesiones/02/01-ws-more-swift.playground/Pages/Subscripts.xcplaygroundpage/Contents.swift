//: [Anterior](@previous)

/*:
 # Subscripts
 
 Classes, Structs y Enums pueden definir _subscripts_.
 
 */

let array = [1, 2, 3, 4]
array[1]

/*:
 ## Sintaxis:
 
 ```
 subscript(index: Int) -> Int {
    get {
        // return an appropriate subscript value here
    }
    set(newValue) {
        // perform a suitable setting action here
    }
 }
 ```
 */
