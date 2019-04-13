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

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var animals : [Animal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1125, height: 500)

        
        var lionSound: AVAudioPlayer?
        let pathLion = Bundle.main.path(forResource: "lionSound.mp3", ofType: nil)!
        let urlLion = URL(fileURLWithPath: pathLion)
        
        do {
            lionSound = try AVAudioPlayer(contentsOf: urlLion)
            lionSound?.play()
        } catch {
            // couldn't load file :(
        }
        
        
        var tigerSound: AVAudioPlayer?
        let pathTiger = Bundle.main.path(forResource: "tigerSound.mp3", ofType: nil)!
        let urlTiger = URL(fileURLWithPath: pathTiger)
        
        do {
            tigerSound = try AVAudioPlayer(contentsOf: urlTiger)
            tigerSound?.play()
        } catch {
            // couldn't load file :(
        }
        
        
        var bearSound: AVAudioPlayer?
        let pathBear = Bundle.main.path(forResource: "bearSound.mp3", ofType: nil)!
        let urlBear = URL(fileURLWithPath: pathBear)
        
        do {
            bearSound = try AVAudioPlayer(contentsOf: urlBear)
            bearSound?.play()
        } catch {
            // couldn't load file :(
        }
        
        
        let lionObj = Animal(name: "Simba", species: "Lion", age: 24, image: UIImage(named: "lionPic")!, soundPath: pathLion)
        
        let tigerObj = Animal(name: "Tony", species: "Tiger", age: 67, image: UIImage(named: "tigerPic")!, soundPath: pathTiger)
        
        let bearObj = Animal(name: "Ted", species: "Bear", age: 35, image: UIImage(named: "bearPic")!, soundPath: pathBear)
        
        animals.append(lionObj)
        animals.append(tigerObj)
        animals.append(bearObj)
        
        let shuffled = animals.shuffled()
        //https://www.hackingwithswift.com/example-code/arrays/how-to-randomize-the-order-of-an-array-shuffle-and-shuffled
        
    }


    

}

