//
//  ViewController.swift
//  WhackAMole
//
//  Created by Saeed Rahman on 11/2/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonEleven: UIButton!
    @IBOutlet weak var buttonTwelve: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var gameTimer = Timer()
    var currentScore = 0
    var numberOfLives = 5
    var molesArray = [UIButton]()
    var isButtonTouched = false
    
    @objc func generateMoles() {
        let randomNumber = Int.random(in: 0 ..< molesArray.count)
        molesArray[randomNumber].isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.molesArray[randomNumber].isHidden = true
            self.isButtonTouched = false
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        isButtonTouched = true
        currentScore += 1
        scoreLabel.text = String(currentScore)
        print(isButtonTouched)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        molesArray += [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine, buttonTen, buttonEleven, buttonTwelve]
        
        for mole in molesArray {
            mole.isHidden = true
        }
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateMoles), userInfo: nil, repeats: true)
    }
}
