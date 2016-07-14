//: [Anterior](@previous)

/*:
 # Optionals
 
 Los opcionales son otro typo de dato que 
 - Puede tener un valor
 - Puede no tener un valor
 
 Este tipo de dato tiene asociado el tipo que podría contener, y en caso de no contenerlo su valor es `nil`
 
 Se acuerdan del gato?
 
 */

import Foundation


struct Cat {
    var name: String
}

func openBox() -> Cat? {
    let dead = arc4random_uniform(2)
    return dead == 1 ? nil : Cat(name: "Francisco")
}


let maybeCat = openBox()

//Force unwrap
//maybeCat!.name

let maybeName = maybeCat?.name

if maybeCat != nil {
    print(maybeCat!.name)
}

if let name = maybeCat?.name {
    print(name)
}

func catName(cat: Cat?) -> String {
    guard let notOptionalCat = cat else { return "" }
    
    return notOptionalCat.name
}

catName(maybeCat)


//: [Siguiente](@next)
