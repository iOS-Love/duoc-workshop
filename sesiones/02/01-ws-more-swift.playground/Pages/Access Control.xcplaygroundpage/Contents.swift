//: [Anterior](@previous)

//: # Access Control

/*:
 ## Private
 
 - Restringe el uso en el mismo **archivo**.


 ## Internal
 
 - Dentro del mismo módulo.
 - Utilizado por defecto.
 
 ## Public
 
 - Directamente por el mismo módulo (igual a Internal)
 - + en cualquier otro módulo que importe el módulo donde el archivo está
 
 ## Sintáxis:
 */

//: ### Funciones
private func privateFoo() {}
internal func internalFoo() {}
public func publicFoo() {}

func someFoo() { }
//: ### Variables
private var privateBar: Int = 0
internal var internalBar: Int = 0
//: ### Clases
internal class InternalClass {
    static func myStaticFunc() {

    }

    func myInternalFunc() {
        privateFoo()
        internalFoo()
    }
}

let myClass = InternalClass()
InternalClass.myStaticFunc()
//: ### Protocolos
internal protocol MyProtocol {}
//: ### Ejemplo:
class PublicClass {
    static func staticFoo() {

    }

    private func foo() {
        privateFoo()
        internalFoo()
    }
}
//: [Siguiente](@next)
