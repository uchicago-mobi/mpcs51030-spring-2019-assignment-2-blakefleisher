//
//  ViewController.swift
//  ItsAZooInThere
//
//  Created by BF on 4/12/19.
//  Copyright © 2019 BF. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var animals : [Animal] = []
    
    
    @objc func buttonTapped(_ sender:UIButton) {
        let animal = animals[sender.tag]
        let alertController = UIAlertController(
            title: animal.name,
            message: "Age: \(animal.age), Species: \(animal.species)",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
            title: "Okay",
            style: .default
        ))
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 1125, height: 500)
        
        let pathLion = Bundle.main.path(forResource: "lionSound.mp3", ofType: nil)!
        
        let pathTiger = Bundle.main.path(forResource: "tigerSound.mp3", ofType: nil)!
        
        
        let pathBear = Bundle.main.path(forResource: "bearSound.mp3", ofType: nil)!
        
        
        let lionObj = Animal(name: "Simba", species: "Lion", age: 24, image: UIImage(named: "lionPic")!, soundPath: pathLion)
        
        let tigerObj = Animal(name: "Tony", species: "Tiger", age: 67, image: UIImage(named: "tigerPic")!, soundPath: pathTiger)
        
        let bearObj = Animal(name: "Ted", species: "Bear", age: 35, image: UIImage(named: "bearPic")!, soundPath: pathBear)
        
        animals.append(lionObj)
        animals.append(tigerObj)
        animals.append(bearObj)
        
        let shuffled = animals.shuffled()
        //https://www.hackingwithswift.com/example-code/arrays/how-to-randomize-the-order-of-an-array-shuffle-and-shuffled
        
        
        var xVal = 375/2
        var imageX = 0
        print(animals.count)
        for (index, animal) in animals.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(animal.name, for: .normal)
            
            button.tag = index
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
            
            button.frame = CGRect(x: xVal, y: 0, width: (375/2 - 140), height: 30)
            
            //button.backgroundColor = UIColor.blue
            scrollView.addSubview(button)
            
            let animalImage = UIImageView(frame: CGRect(x: imageX, y: 200, width: 375, height: 250))
            xVal += 375
            imageX += 375
            
            animalImage.image = animal.image
            scrollView.addSubview(animalImage)
            
            
            
        }

        
        
        
//        let button1 = UIButton(type: .system)
//        button1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        button1.backgroundColor = UIColor.blue
//        scrollView.addSubview(button1)
//
//        let button2 = UIButton(type: .system)
//        button2.frame = CGRect(x: 80, y: 0, width: 30, height: 30)
//        button2.backgroundColor = UIColor.blue
//        scrollView.addSubview(button2)
//
        
        
        
       
        
    }


    

}

