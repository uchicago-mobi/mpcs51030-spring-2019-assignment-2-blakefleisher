//
//  Animal.swift
//  ItsAZooInThere
//
//  Created by BF on 4/12/19.
//  Copyright © 2019 BF. All rights reserved.
//

import Foundation
import UIKit

class Animal: CustomStringConvertible {
    
    let name: String
    let species: String
    let age: Int
    let image: UIImage
    let soundPath: String

    init (name: String, species: String, age: Int, image: UIImage, soundPath: String) {
        self.name = name
        self.species = species
        self.age = age
        self.image = image
        self.soundPath = soundPath
    }
    
    var description: String {
        var description = ""
        description += "name: \(self.name)\n"
        description += "species: \(self.species)\n"
        description += "age: \(self.age)\n"
        return description
    }
}

// Used this source: https://medium.com/@YogevSitton/use-auto-describing-objects-with-customstringconvertible-49528b55f446

