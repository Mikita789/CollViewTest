//
//  ModelData.swift
//  CollViewTest
//
//  Created by Никита Попов on 17.01.23.
//

import Foundation


struct Person{
    var name: String
    var imageName:String
}

struct TestData{
    static func allData()->[Person]{
        [  .init(name: "Morty", imageName: "morty"),
           .init(name: "Rick", imageName: "rick")
        ]
    }
}


