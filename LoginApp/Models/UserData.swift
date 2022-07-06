//
//  UserData.swift
//  LoginApp
//
//  Created by ikorobov on 05.07.2022.
//

import Foundation


struct User {
    
    let username: String
    let password: String
    let about: Person
    
    static func getUser() -> User {
        User.init(
            username: "qwerty",
            password: "qwerty",
            about: Person.init(
                name: "Иван",
                surname: "Коробов",
                age: 33,
                future: "Будущий swift-разработчик",
                past: "В прошлом юрист.\nБеззаботный, беспечный, бестолковый,\nбезработный",
                present: "В силу разных обстоятельств\nвыживаю под палящим (до +37)\nСербским солнцем.\nСтрадаю.",
                sadButTrue: "Но это не точно",
                images: ["userAvatar", "pastImage", "presentImage"]
            )
        )
        
    }
    
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let future: String
    let past: String
    let present: String
    let sadButTrue: String
    let images: [String]
}


