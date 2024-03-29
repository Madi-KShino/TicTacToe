//
//  GameViewController.swift
//  BestApp
//
//  Created by Darin Marcus Armstrong on 7/17/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var buttonOne: GridButton!
    @IBOutlet weak var buttonTwo: GridButton!
    @IBOutlet weak var buttonThree: GridButton!
    @IBOutlet weak var buttonFour: GridButton!
    @IBOutlet weak var buttonFive: GridButton!
    @IBOutlet weak var buttonSix: GridButton!
    @IBOutlet weak var buttonSeven: GridButton!
    @IBOutlet weak var buttonEight: GridButton!
    @IBOutlet weak var buttonNine: GridButton!
    @IBOutlet weak var restartButton: UIButton!
    
    //Properties
    var playerImage = #imageLiteral(resourceName: "cross")
    
    var buttons: [GridButton] {
        return [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine]
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()           
        view.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        restartButton.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        restartButton.addBorder()
        restartButton.layer.cornerRadius = restartButton.frame.height / 2
        restartButton.tintColor = #colorLiteral(red: 0.7804725766, green: 0.5906895995, blue: 0.4685797691, alpha: 1)
    }
    
    //All Possible Win Conditions
    func checkForWinner(player: String) {
        if buttonOne.imageView?.image == buttonTwo.imageView?.image && buttonOne.imageView?.image == buttonThree.imageView?.image && buttonOne.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonFour.imageView?.image == buttonFive.imageView?.image && buttonFour.imageView?.image == buttonSix.imageView?.image && buttonFour.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonSeven.imageView?.image == buttonEight.imageView?.image && buttonSeven.imageView?.image == buttonNine.imageView?.image && buttonSeven.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonOne.imageView?.image == buttonFour.imageView?.image && buttonFour.imageView?.image == buttonSeven.imageView?.image && buttonOne.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonTwo.imageView?.image == buttonFive.imageView?.image && buttonTwo.imageView?.image == buttonEight.imageView?.image && buttonTwo.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonThree.imageView?.image == buttonSix.imageView?.image && buttonSix.imageView?.image == buttonNine.imageView?.image && buttonThree.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonOne.imageView?.image == buttonFive.imageView?.image && buttonFive.imageView?.image == buttonNine.imageView?.image && buttonOne.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else if buttonThree.imageView?.image == buttonFive.imageView?.image && buttonFive.imageView?.image == buttonSeven.imageView?.image && buttonThree.imageView?.image != nil {
            presentWinnerAlert(player: player)
        }
        else {
            var allFilled = true
            for button in buttons {
                if button.imageView?.image == nil {
                    allFilled = false
                }
            }
            if allFilled {
                presentTieAlert()
            }
        }
    }
    
    //Button Display for Player Turns
    func switchImage(button: GridButton) {
        if button.imageView!.image == nil {
            if playerImage == #imageLiteral(resourceName: "cross") {
                button.setImage(playerImage, for: .normal)
                checkForWinner(player: "Player X")
                playerImage = #imageLiteral(resourceName: "circle")
            } else if playerImage == #imageLiteral(resourceName: "circle") {
                button.setImage(playerImage, for: .normal)
                checkForWinner(player: "Player O")
                playerImage = #imageLiteral(resourceName: "cross")
            }
        }
    }
    
    //Clear Board
    func clearImage(button: UIButton) {
        button.setImage(nil, for: .normal)
        button.imageView?.image = nil
        playerImage = #imageLiteral(resourceName: "cross")
    }
    
    //Actions
    @IBAction func buttonOneTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonTwoTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonThreeTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonFourTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonFiveTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonSixTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonSevenTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonEightTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }
    
    @IBAction func buttonNineTapped(_ sender: GridButton) {
        switchImage(button: sender)
    }

    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        for button in buttons {
            clearImage(button: button)
        }
    }
}

//Alert Actions
extension GameViewController {
    func presentWinnerAlert (player: String) {
        let alert = UIAlertController(title: "WINNER!", message: "Way to go \(player)", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .destructive) { (action) in
            for button in self.buttons {
                self.clearImage(button: button)
            }
        }
        alert.addAction(newGameButton)
        present(alert, animated: true)
    }
    
    func presentTieAlert () {
        _ = UIAlertController(title: "CAT!", message: "It's a tie", preferredStyle: .alert)
        _ = UIAlertAction(title: "New Game", style: .destructive) { (action) in
            for button in self.buttons {
                self.clearImage(button: button)
            }
        }
        
    }
}

//Extensions for changing view components
extension UIView {
    
    func addCornerRadius(_ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
    }
    
    func addBorder(width: CGFloat = 5, color: UIColor = #colorLiteral(red: 0.7804725766, green: 0.5906895995, blue: 0.4685797691, alpha: 1)) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
