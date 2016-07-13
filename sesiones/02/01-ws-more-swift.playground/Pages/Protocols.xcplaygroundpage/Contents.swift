//: [Anterior](@previous)

/*:
 # Protocols

 Define una interfaz de métodos, propiedades y otros requerimientos.
 El protocolo luego puede ser **adoptado** por una **Clase**, **Struct** o **Enum**.
 Cualquier tipo que satisface los requerimientos de un protocolo, se dice que **conforma** a dicho protocolo.
 
 ## Sintaxis:
 */

protocol SomeProtocol { }
protocol SomeOtherProtocol { }

struct MyStruct: SomeProtocol, SomeOtherProtocol { }

//: ## Propiedades. De instancia, de tipo.

//: ## Métodos

//: ## Inicializadores

/*:
 # Los protocolos son **Tipos**:
 
 Por ello se pueden utilizar como:
 - Parametro en una función, método o inicializador.
 - Tipo de una constante, varible o propiedad.
 - Tipo de items en un arreglo, dictionario u otro contenedor.
 
 ## Ejemplo:
 */


//: [Siguiente](@next)
