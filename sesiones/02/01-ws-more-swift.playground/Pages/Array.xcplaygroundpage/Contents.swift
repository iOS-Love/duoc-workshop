//: [Anterior](@previous)
/*:
 ## Array
 
 Coleccion de elementos que mantienen un orden.
 
 Idealmente mantener el mismo tipo, ya que es lo hace mas fácil operar sobre ellos.
 
 Uno puede encontrar diferentes tipos de elementos por ejemplo al parsear un JSON.
 
 Recuerden. Si es `let` no podremos modificar su contentido
 */
var a: [Any] = [1, "a", 3.1415, ("left", "right"), [0, 1, 2]]

var languages: [String] = []
languages = ["Swift","Objective-C"]
languages += ["Python", "Java"]
languages.count
languages[0]
languages.append("C")
languages.indexOf("Java")
languages.removeAtIndex(3)
languages.sort()
languages
languages.sortInPlace()

//: [Siguiente](@next)
