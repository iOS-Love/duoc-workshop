//: [Anterior](@previous)

/*:
 # Protocol Extension

 Un tipo puede adherir a un protocolo en una extensión.

 ## Sintaxis:
 */

protocol TextRepresentable {
    var textualDescription: String { get }
}

protocol MoreFiniteTextRepresentable: TextRepresentable {
    var moreTextualDescription: String { get }
}

struct Person {
    let name: String
}

extension Person: MoreFiniteTextRepresentable {
    var textualDescription: String {
        return "My name is: \(name)"
    }

    var moreTextualDescription: String {
        return ""
    }
}

extension Person: Equatable { }

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}

extension Person: Hashable {
    var hashValue: Int {
        return 0
    }
}

let person = Person(name: "Francisco")
person.textualDescription

//: ### Aún cuando no se tenga acceso al código fuente del tipo.
extension Int: TextRepresentable {
    var textualDescription: String {
        return "My value \(self)"
    }
}

let myInt = 1
myInt.textualDescription

//: ### **Default implementation** de una variable en un protocolo

extension TextRepresentable {
    var textualDescription: String {
        return "abc"
    }
}

class AnotherThing: TextRepresentable {

}

let myClass = AnotherThing()
myClass.textualDescription
//: [Siguiente](@next)
