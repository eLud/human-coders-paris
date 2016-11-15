//: ## Classes

class Animal {

    init(age: Int) {
        self.age = age
    }

    convenience init() {
        self.init(age: 0)
    }

    var age: Int { // Propriété stockée avec observateurs
        willSet {
            print("L'age de l'animal va changer, la valeur actuelle est \(age), la future valeur est : \(newValue)")
        }

        didSet {
            print("L'age de l'animal a changé, la valeur actuelle est \(age), l'ancienne valeur était : \(oldValue)")
        }
    }
}

class Dog: Animal {

    init(name: String, age: Int) {
        self.name = name
        super.init(age: age)
        self.age = age
    }

    convenience init() {
        self.init(name: "Brutus", age: 0)
    }

    var name: String

    var humanAge: Int { //Propriété calculée 
        get {
            return age*7
        }

        set {
            age = newValue/7
        }
    }

    func aboie() {
        print("Wouf")
    }
}

let monChien = Dog()
let chien2 = monChien
monChien.name
monChien.age = 5
monChien.aboie()

chien2.age

//: - note: Les classes peuvent faire de l'héritage simple

//: ## Structures

//: - note: Les instances de classes sont gérées par références (reference type", les instances de strcutures sont gérées par "valeur" (value type)

struct Cat {

    static var maxAge = 15

    var name = "Félix" // Propriété stockée
    var age: Int = 0

    var humanAge: Int { return age*7 } //Propriété calculée en "lecture" seule

    var chatons: Array<Cat> = []

    func miaule() {
        print("Miaou")
        Cat.maxAge
    }
}

var monChat = Cat()
var chat2 = monChat
monChat.age = 5
monChat.humanAge
monChat.name
monChat.miaule()

Cat.maxAge = 17

chat2.age

//: - note: Les structures ne peuvent pas hériter, mais c'est pas grave (https://developer.apple.com/videos/play/wwdc2015/408/)

let chat3 = Cat()
let chien3 = Dog()

//: ## Énumérations
// Enum with associated values
enum TransportStatus {
    case onTime
    case delayed(delay: Int, cause: String)
    case cancelled
    case unknown
}

//: - note: les valeurs associées peuvent ^tre de n'impotre quel type
var status: TransportStatus = .onTime
status = .delayed(delay: 5, cause: "Grève")

struct Train {

    let trainNumber: Int
    let origin: String
    let destination: String

    var status: TransportStatus
}

var train = Train(trainNumber: 572, origin: "Paris", destination: "Marseille", status: .onTime)

train.status = .delayed(delay: 5, cause: "Grève")

switch train.status {
case .onTime:
    print("Ontime")
case .delayed (let delay, let cause) where delay < 15:
    print("delayed by \(delay) minutes because of \(cause)")
case .delayed:
    fallthrough
case .cancelled:
    print("cancelled")
case .unknown:
    print("unknown")
}

//: - note: La clause where npeut être utilisée ailleurs que dans les switch
for i in 0...100 where i%2 == 0{
        print(i)
}

//Enums with raw values
enum TrainType: String {
    case rer = "RER"
    case transilien = "Transilien"
    case metro
    case ter

    func test() {

    }

    var something: Int {
        return 5
    }
}

let type = TrainType.transilien
type.test()

let otherType = TrainType(rawValue: "RER")

let downloadedValue = "RER"
guard let type = TrainType(rawValue: downloadedValue) else { fatalError("Bad value in JSON")}

//: ## Protocoles
protocol Flying {
    var maxFlyingSpeed: Int { get }
    func fly(distance: Int)
}

protocol Living {
    var age: Int {get set}
}

protocol Human: Living {
    var name: String { get }
}

struct SuperHero: Flying, Living {

    var name: String
    var mortalEnnemy: String
    var age: Int

    let maxFlyingSpeed: Int
    func fly(distance: Int) {

    }
}

class Bird: Living, Flying {
    var age: Int = 0

    let maxFlyingSpeed: Int = 40
    func fly(distance: Int) {

    }
}

func makeOlder(_ living: Living) -> Living {
    var newLiving = living
    newLiving.age += 1
    return newLiving
}

let superman = SuperHero(name: "SuperMan", mortalEnnemy: "Lex Luthor", age: 26, maxFlyingSpeed: 200)
let littleBird = Bird()

let tab: [Flying & Living] = [superman, littleBird]

for truc in tab {
    truc.fly(distance: 10)
    truc.maxFlyingSpeed
    truc.age
    makeOlder(truc)
}

littleBird.age
superman.age

superman.fly(distance: 10)



//: ## Création d'une couche modèle

//: - note: Ne JAMAIS utiliser de types spécifiques dans la couche modèle (pas de UIKit par exemple) pour maximiser la réutilisabilité !
import Foundation

struct Place: Hashable {

    enum Source {
        case internet
        case local
    }

    let name: String
    let latitude: Double?
    let longitude: Double?
    let address: String
    let phoneNumber: String
    
    let website: URL?
    let wikipedia: URL?

    var stars: Float
    var numberOfReviews: Int

    let origin: Source

    init(name: String, latitude: Double? = nil, longitude: Double? = nil, address: String, phoneNumber: String, website: URL? = nil, wikipedia: URL? = nil, stars: Float, numberOfReviews: Int, origin: Source = .local) {

        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.phoneNumber = phoneNumber
        self.website = website
        self.wikipedia = wikipedia
        self.stars = stars
        self.numberOfReviews = numberOfReviews
        self.origin = origin
    }

    static func ==(lhs: Place, rhs: Place) -> Bool {
        if lhs.name == rhs.name && lhs.address == rhs.address {
            return true
        }
        return false
    }

    var hashValue: Int {
        return "\(name) \(address)".hashValue
    }
}

let sCoeur = Place(name: "Sacré-Cœur", latitude: 48.886918, longitude: -2.343404, address: "35 Rue du Chevalier de la Barre, 75018 Paris", phoneNumber: "01 53 41 89 00", website: nil, wikipedia: nil, stars: 5, numberOfReviews: 1, origin: .local)

let somethingelse = Place(name: "", latitude: nil, longitude: nil, address: "", phoneNumber: "", website: nil, wikipedia: nil, stars: 0, numberOfReviews: 0, origin: .local)

sCoeur == somethingelse

class Directory {

    private var places: Set<Place> = []

    var allPlaces: [Place] {
        return Array(places)
    }

    func add(_ place: Place) {
        let result = places.insert(place)
        if result.inserted == false {
            print(place.name + " is already here!")
        }
    }
}

let directory = Directory()
directory.add(sCoeur)
directory.add(sCoeur)
directory.add(sCoeur)
directory.add(sCoeur)

directory.allPlaces









































