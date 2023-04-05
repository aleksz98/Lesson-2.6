//
//  UserInformation.swift
//  Lesson 2.6
//
//  Created by Иван on 05.04.2023.
//

struct userData {
    let login: String
    let password: String
    let myName: String
    let mySurname: String
    let myCompany: String
    let myDepartment: String
    let myPosition: String
    let myBio: String


    static func getUserData() -> [userData] {
        [
            userData(
                login: "Alexey",
                password: "123456",
                myName: "Tim",
                mySurname: "Cook",
                myCompany: "Apple",
                myDepartment: "Managment",
                myPosition: "CEO",
                myBio: "fekksefkl"
            )
        ]
    }
}
