//: [Previous](@previous)
import UIKit
import XCPlayground

let window = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
window.backgroundColor = .whiteColor()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
XCPlaygroundPage.currentPage.liveView = window

/*:
 # UILabel

 Los `labels` son etiquetas que nos ayudan a mostrar texto en pantalla, tiene propiedades básicas que nos pueden permitir darle mas estilo a nuestra aplicación.
 
 - textColor
 - font
 - text
 - textAlignment

 */

let frame = CGRect(x: 20, y: 50, width: 335, height: 100)
let label = UILabel(frame: frame)
label.text = "WORKSHOP"
label.textAlignment = .Left
label.font = UIFont(name: "Avenir-Black", size: 45)
label.textColor = UIColor.darkGrayColor()
label.backgroundColor = UIColor.blackColor()

window.addSubview(label)

//: [Next](@next)
