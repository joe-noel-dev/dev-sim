//
//  Names.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import Foundation

struct Name {
    let first: String
    let last: String

    var full: String {
        "\(first) \(last)"
    }

    static func empty() -> Self {
        .init(first: .init(), last: .init())
    }

    static func generate() -> Self {
        .init(first: firstNames.randomElement()!, last: lastNames.randomElement()!)
    }
}

let firstNames: [String] = [
    "Oliver",
    "George",
    "Noah",
    "Arthur",
    "Harry",
    "Leo",
    "Muhammad",
    "Jack",
    "Charlie",
    "Oscar",
    "Jacob",
    "Henry",
    "Thomas",
    "Freddie",
    "Alfie",
    "Theo",
    "William",
    "Theodore",
    "Archie",
    "Joshua",
    "Alexander",
    "James",
    "Isaac",
    "Edward",
    "Lucas",
    "Tommy",
    "Finley",
    "Max",
    "Logan",
    "Ethan",
    "Mohammed",
    "Teddy",
    "Benjamin",
    "Arlo",
    "Joseph",
    "Sebastian",
    "Harrison",
    "Elijah",
    "Adam",
    "Daniel",
    "Samuel",
    "Louie",
    "Mason",
    "Reuben",
    "Albie",
    "Rory",
    "Jaxon",
    "Hugo",
    "Luca",
    "Zachary",
    "Reggie",
    "Hunter",
    "Louis",
    "Dylan",
    "Albert",
    "David",
    "Jude",
    "Frankie",
    "Roman",
    "Ezra",
    "Toby",
    "Riley",
    "Carter",
    "Ronnie",
    "Frederick",
    "Gabriel",
    "Stanley",
    "Bobby",
    "Jesse",
    "Michael",
    "Elliot",
    "Grayson",
    "Mohammad",
    "Liam",
    "Jenson",
    "Ellis",
    "Harley",
    "Harvey",
    "Jayden",
    "Jake",
    "Ralph",
    "Rowan",
    "Elliott",
    "Jasper",
    "Ollie",
    "Charles",
    "Finn",
    "Felix",
    "Caleb",
    "Chester",
    "Jackson",
    "Hudson",
    "Leon",
    "Ibrahim",
    "Ryan",
    "Blake",
    "Alfred",
    "Oakley",
    "Matthew",
    "Luke",
    "Olivia",
    "Amelia",
    "Isla",
    "Ava",
    "Mia",
    "Isabella",
    "Sophia",
    "Grace",
    "Lily",
    "Freya",
    "Emily",
    "Ivy",
    "Ella",
    "Rosie",
    "Evie",
    "Florence",
    "Poppy",
    "Charlotte",
    "Willow",
    "Evelyn",
    "Elsie",
    "Phoebe",
    "Sophie",
    "Sienna",
    "Alice",
    "Sofia",
    "Ruby",
    "Isabelle",
    "Harper",
    "Matilda",
    "Daisy",
    "Emilia",
    "Jessica",
    "Maya",
    "Eva",
    "Luna",
    "Millie",
    "Eliza",
    "Chloe",
    "Maisie",
    "Penelope",
    "Aria",
    "Esme",
    "Scarlett",
    "Imogen",
    "Thea",
    "Ada",
    "Layla",
    "Harriet",
    "Mila",
    "Violet",
    "Eleanor",
    "Bella",
    "Erin",
    "Elizabeth",
    "Rose",
    "Molly",
    "Hallie",
    "Emma",
    "Lola",
    "Lucy",
    "Bonnie",
    "Ellie",
    "Nancy",
    "Robyn",
    "Zara",
    "Lottie",
    "Hannah",
    "Maria",
    "Aurora",
    "Arabella",
    "Holly",
    "Jasmine",
    "Gracie",
    "Georgia",
    "Delilah",
    "Darcie",
    "Orla",
    "Amber",
    "Amelie",
    "Iris",
    "Anna",
    "Abigail",
    "Ayla",
    "Maryam",
    "Lilly",
    "Annabelle",
    "Sara",
    "Edith",
    "Beatrice",
    "Clara",
    "Summer",
    "Heidi",
    "Margot",
    "Martha",
    "Zoe",
    "Lara",
    "Lyla",
    "Mabel",
    "Felicity",
]

let lastNames = [
    "Smith",
    "Jones",
    "Williams",
    "Taylor",
    "Brown",
    "Davies",
    "Evans",
    "Wilson",
    "Thomas",
    "Johnson",
    "Roberts",
    "Robinson",
    "Thompson",
    "Wright",
    "Walker",
    "White",
    "Edwards",
    "Hughes",
    "Green",
    "Hall",
    "Lewis",
    "Harris",
    "Clarke",
    "Patel",
    "Jackson",
    "Wood",
    "Turner",
    "Martin",
    "Cooper",
    "Hill",
    "Ward",
    "Morris",
    "Moore",
    "Clark",
    "Lee",
    "King",
    "Baker",
    "Harrison",
    "Morgan",
    "Allen",
    "James",
    "Scott",
    "Phillips",
    "Watson",
    "Davis",
    "Parker",
    "Price",
    "Bennett",
    "Young",
    "Griffiths",
    "Mitchell",
    "Kelly",
    "Cook",
    "Carter",
    "Richardson",
    "Bailey",
    "Collins",
    "Bell",
    "Shaw",
    "Murphy",
    "Miller",
    "Cox",
    "Richards",
    "Khan",
    "Marshall",
    "Anderson",
    "Simpson",
    "Ellis",
    "Adams",
    "Singh",
    "Begum",
    "Wilkinson",
    "Foster",
    "Chapman",
    "Powell",
    "Webb",
    "Rogers",
    "Gray",
    "Mason",
    "Ali",
    "Hunt",
    "Hussain",
    "Campbell",
    "Matthews",
    "Owen",
    "Palmer",
    "Holmes",
    "Mills",
    "Barnes",
    "Knight",
    "Lloyd",
    "Butler",
    "Russell",
    "Barker",
    "Fisher",
    "Stevens",
    "Jenkins",
    "Murray",
    "Dixon",
    "Harvey",
]
