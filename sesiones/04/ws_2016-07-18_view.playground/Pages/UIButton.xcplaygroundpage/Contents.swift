//: [Previous](@previous)
import UIKit
import XCPlayground

let window = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
window.backgroundColor = .whiteColor()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
XCPlaygroundPage.currentPage.liveView = window

/*:
# UIButton
 
 Es una subclase de `UIControl`, la cual es subclase de `UIView` es decir representa un recangulo en la pantalla.
 
 Los botones son interactivos, nos permiten responder a las interacciones del usuario
 
 Por defecto los botones manejan estados definidos por un enum, `.Normal`, `.Disabled`, `.Highlighted`, `.Selected`
 
 Pueden tener diferentes estilos para sus diferentes estados, como títulos y colores.
 
 También responden a varios gestos, como cuando se presionan o se sueltan, por lo general se utiliza "Touch Up Inside" como el gesto por defecto.

 */


let frame = CGRect(x: 0, y: 0, width: 100, height: 44)
let button = UIButton(frame: frame)
window.addSubview(button)

//no se ve.. es blanco

button.setTitle("Normal", forState: .Normal)
button.setTitleColor(UIColor.blueColor(), forState: .Normal)

button.setTitle("Hold", forState: .Highlighted)
button.setTitleColor(UIColor.redColor(), forState: .Highlighted)

button.setTitle("Disabled", forState: .Disabled)
button.setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)


class ViewController {
    dynamic func didClick() {
        print("click")
    }
}

let target = ViewController()


button.addTarget(target, action: #selector(ViewController.didClick), forControlEvents: .TouchUpInside)



//: [Next](@next)
