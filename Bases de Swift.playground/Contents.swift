//: Playground - noun: a place where people can play

//: # Variables & constantes

let firstName: String = "Ludovic"
let lastName = "Ollagnier" // Swift utilise l'inférence du type

var age: Int = 30
var lovesSwift: Bool = true
var height: Float = 1.83

//: - note: Par défaut, pensez à mettre let, et à utiliser la type inference

let test = 0.5

let a: Float = 5.0
let b: Float = 2.0
let c = Double(a) / Double(b)

/*: 
 - note:
Swift ne réalise pas de "cast" implicite. Pour changer de type, il faut reconstruire une nouvelle instance
\
alt+click sur une variable/morceau de code affiche sa "documentation"
*/

//: # Types Swift

//:## String
let helloString = "Hello"
let worldString = "world"

helloString + " " + worldString + "!"
"Je suis " + firstName + ", et j'ai \(age) ans"

helloString.isEmpty
helloString.hasPrefix("he")
worldString.hasSuffix("ld")

//: ## Character
let 🐶: Character = "🐩"
let exclamation: Character = "!"
var warning = "Attention au \(🐶) "
warning.append(exclamation)

//: ## Collections
// Tableau : suite d'éléments ordonnées et indéxés'
// Array

// Dictionnaire : association d'éléments clé/valeurs
// Dictionary

// Ensemble : ensemble non ordonné non indexé
// Set

//: - note: Les collections sont toujours typées !

//: ### Tableaux
var tableau: [String] = ["1", "2", "3", "4"]
tableau.append("5")
tableau.insert("", at: 3)
let élémentÀIndex2 = tableau[2]
let élémentÀIndex2à4inclus = tableau[2...4]
let élémentÀIndex2à4exclus = tableau[2..<4]
tableau.count
tableau.isEmpty

tableau[1...3] = ["Deux", "Trois"]
tableau

//: ### Dictionnaires
var dico: [String: String] = ["firstName" : "Ludovic", "lastName": "Ollagnier"]

dico["firstName"]
dico["dogName"] = "Médor"
dico["dogName"] = "Brutus"
dico
dico["dogName"] = nil
dico.removeValue(forKey: "")
dico
//: ### Ensembles
var ensemble = Set<String>()
ensemble.insert("Paris")
ensemble.insert("Paris")
ensemble.insert("Paris")
ensemble.insert("Paris")
ensemble.insert("Marseille")

ensemble

var ensemble2: Set = ["Paris", "Bordeaux"]
ensemble2.symmetricDifference(ensemble)

//: ## Boucles

for truc in dico {
    truc.key
}

for (key, value) in dico {
    key
    value
}

for _ in 0...9 {
    print("toto")
}

//: ## Conditions

var greeting = "Good Morning"

switch greeting {

case "Good Morning":
    print("It's morning")

case "Good Evening":
    print("It's evening")

default:
    print("I don't know")
}

guard age < 40 else { fatalError("Age is too big") }

//: ## Fonctions
func fait() {
    print("Fait !")
}

fait()

func affiche(_ qqchose: String) {
    print(qqchose)
}

affiche("Bonjour")

func mange(_ aliment: String = "Pain au chocolat", au repas: String = "Déjeuner") {

    print("Je mange: " + aliment + " au " + repas)
}

mange("Gateau")
mange("toiti", au: "toto")

//: - note: Paramètre par défaut, possibilité de l'omettre à l'appel

mange("Pain", au: "Diner")

func multiply(a: Int, b: Int) -> Int {

    return a*b
}

//Tuple

func loadURL() -> (statusCode: Int, message: String) {

    return (200, "OK")
}

let result = loadURL()
result.message

let (status, message) = loadURL()
status
message

let ratio = (horizontal: 0.5, vertical:1.0)
ratio.horizontal

//: ## Optionnels

let nbHab = ["Paris": 4, "Marseille": 2]

let habParis = nbHab["Lyon"]

if habParis != nil {
    habParis!*2
}

//if-let syntax
if let habMarseille = nbHab["Marseille"] {
    habMarseille*2
} else {

}

//guard-let
guard let paris = nbHab["Paris"] else { fatalError() }
paris*4

//: - note: TOUJOURS tester une valeur optionnelle avant usage/déballage









