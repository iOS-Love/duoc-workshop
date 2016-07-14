//: [Anterior](@previous)

/*:
 # Protocols

 Define una interfaz de métodos, propiedades y otros requerimientos.
 El protocolo luego puede ser **adoptado** por una **Clase**, **Struct** o **Enum**.
 Cualquier tipo que satisface los requerimientos de un protocolo, se dice que **conforma** a dicho protocolo.
 
 ## Sintaxis:
 */

protocol SomeProtocol {
    //var foo: Int { get }
}
protocol SomeOtherProtocol {
    //var foo: String { get }
}

struct MyStruct: SomeProtocol, SomeOtherProtocol { }
//: ## Propiedades. De instancia, de tipo.
protocol PropertyProtocol {
    var isProtocol: Bool { get }
}

class MyClassImplementsProtocol: PropertyProtocol {
    var isProtocol: Bool {
        return false
    }
}
//: ## Métodos
protocol MyProtocolWithMethod {
    var isProtocol: Bool { get }
    static func myMethod()
}

class MyClassImplementsAnotherProtocol: MyProtocolWithMethod {
    var isProtocol: Bool = true

    static func myMethod() {

    }
}
//: ## Inicializadores
protocol AnotherOneWithInit {
    init(string: String)
}

class SomeClassImplementsInit: AnotherOneWithInit {
    required init(string: String) { }
}

struct AnotherStruct {
    let name: String

    init(name: String) {
        self.name = name
    }
}

let myStruct = AnotherStruct(name: "-")
/*:
 # Los protocolos son **Tipos**:
 
 Por ello se pueden utilizar como:
 - Parametro en una función, método o inicializador.
 - Tipo de una constante, varible o propiedad.
 - Tipo de items en un arreglo, dictionario u otro contenedor.
 
 ## Ejemplo:
 */
protocol MyExampleProtocol {
    var name: String { get }
}

struct MyExampleStruct: MyExampleProtocol {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let array: [MyExampleProtocol] = []

func myReturningFunction() -> MyExampleProtocol {
    return MyExampleStruct(name: "Francisco", age: 29)
}

let myReturningValue = myReturningFunction()
myReturningValue.name


//: [Siguiente](@next)
