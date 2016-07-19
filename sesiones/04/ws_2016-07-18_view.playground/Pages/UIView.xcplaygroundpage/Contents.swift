//: [Previous](@previous)
import UIKit
import XCPlayground

let window = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
window.backgroundColor = .whiteColor()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
XCPlaygroundPage.currentPage.liveView = window

/*:
 # View
 
 **Una vista es una clase que define un área rectangular en la pantalla.**
 
 Agunos tipos de vista permiten interacciones de usuario.
 
 Una vista puede contener una colección de vistas. (Sub Vistas)

 Tiene propiedades básicas con las que podemos trabajar como:
 - Background Color
 - alpha
 - frame

 
 El rectangulo está definido por el `frame` el cual tiene 2 componentes 
 
 - `point` el cual define el origen en la esquina superior izquierda del rectangulo
 - `size` el cual define el tamaño
 */
let frame = CGRect(x: 10, y: 100, width: 200, height: 400)

let view = UIView(frame: frame)
view.backgroundColor = UIColor(red: 0.33, green: 0.2, blue: 0.5, alpha: 1.0)

window.addSubview(view)


//: [Next](@next)
