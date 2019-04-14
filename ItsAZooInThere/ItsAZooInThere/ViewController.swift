//
//  ViewController.swift
//  ItsAZooInThere
//
//  Created by BF on 4/12/19.
//  Copyright © 2019 BF. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    var animals : [Animal] = []
    var animalSound: AVAudioPlayer?
    
    //MARK: LifeCycle
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
        animals.shuffle()
        
        speciesLabel.text = animals[0].species
        
        var xVal = 375/2
        var imageX = 0
        for (index, animal) in animals.enumerated() {
            let button = UIButton(type: .system)
            
            button.setTitle(animal.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
            button.frame = CGRect(x: xVal, y: 0, width: (375/2 - 140), height: 30)
            scrollView.addSubview(button)
            
            let animalImage = UIImageView(frame: CGRect(x: imageX, y: 200, width: 375, height: 250))
            xVal += 375
            imageX += 375
            
            animalImage.image = animal.image
            scrollView.addSubview(animalImage)
        }
    }
    
    //MARK: Helper Methods

    func makeSound(for animal: Animal) {
        let url = URL(fileURLWithPath: animal.soundPath)
        do {
            animalSound = try AVAudioPlayer(contentsOf: url)
            animalSound?.play()
            }
            catch {
            // couldn't load file
            }
    }
    
    func makeAlert(for animal: Animal) {
        let alertController = UIAlertController(
            title: animal.name,
            message: "Age: \(animal.age), Species: \(animal.species)",
            preferredStyle: .alert)
        print(animal)
        
        alertController.addAction(UIAlertAction(
            title: "Okay",
            style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonTapped(_ sender:UIButton) {
        let animal = animals[sender.tag]
        makeSound(for: animal)
        makeAlert(for: animal)
        
 
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xOffset = Int(scrollView.contentOffset.x)
        var currentPage = 1
        if xOffset < 230 {
            currentPage = 0
        } else if xOffset > 585 {
            currentPage = 2
        }
        let currentAnimal = animals[currentPage]
        speciesLabel.text = currentAnimal.species
        
        print(xOffset)
        print(currentAnimal.species)
    }
}
