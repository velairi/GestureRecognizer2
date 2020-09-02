//
//  ViewController.swift
//  GestureRecognizer2
//
//  Created by Valerie Don on 6/25/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var gestureView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scorePlusOrMinusLabel: UILabel!

    let directions = ["Swipe Up", "Swipe Down", "Swipe Left", "Swipe Right"]
    var timeCounter = 0
    var scoreCounter = 0
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()

        let randomIndex = Int.random(in: 0..<directions.count)
        directionLabel.text = directions[randomIndex]

        scoreLabel.text = "Score: \(scoreCounter)"

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_ :)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_ :)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_ :)))
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_ :)))

        leftSwipe.direction = .left
        rightSwipe.direction = .right
        upSwipe.direction = .up
        downSwipe.direction = .down

        gestureView.addGestureRecognizer(leftSwipe)
        gestureView.addGestureRecognizer(rightSwipe)
        gestureView.addGestureRecognizer(upSwipe)
        gestureView.addGestureRecognizer(downSwipe)
    }

    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        let currentDirectionToFollow = directionLabel.text
        switch sender.direction {
        case .left:
            if currentDirectionToFollow == "Swipe Left" {
                scoreCounter += 1
                scorePlusOrMinusLabel.text = "+1  "
                scorePlusOrMinusLabel.textColor = .green
            } else {
                scoreCounter -= 1
                scorePlusOrMinusLabel.text = "-1  "
                scorePlusOrMinusLabel.textColor = .red
            }
        case .right:
            if currentDirectionToFollow == "Swipe Right" {
                scoreCounter += 1
                scorePlusOrMinusLabel.text = "+1"
                scorePlusOrMinusLabel.textColor = .green
            } else {
                scoreCounter -= 1
                scorePlusOrMinusLabel.text = "-1"
                scorePlusOrMinusLabel.textColor = .red
            }
        case .up:
            if currentDirectionToFollow == "Swipe Up" {
                scoreCounter += 1
                scorePlusOrMinusLabel.text = "+1"
                scorePlusOrMinusLabel.textColor = .green
            } else {
                scoreCounter -= 1
                scorePlusOrMinusLabel.text = "-1"
                scorePlusOrMinusLabel.textColor = .red
            }
        case .down:
            if currentDirectionToFollow == "Swipe Down" {
                scoreCounter += 1
                scorePlusOrMinusLabel.text = "+1"
                scorePlusOrMinusLabel.textColor = .green
            } else {
                scoreCounter -= 1
                scorePlusOrMinusLabel.text = "-1"
                scorePlusOrMinusLabel.textColor = .red
            }
        default:
            scoreLabel.text = "Score: \(scoreCounter)"
        }
        fadeOutScorePlusOrMinusLabel()
        let randomIndex = Int.random(in: 0..<directions.count)
        directionLabel.text = directions[randomIndex]
        fadeDirectionLabel()
    }

    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        //stop updating timeLabel
        endTimer()
        timeCounter += 1
        timeLabel.text = "Time: \(timeCounter)"
    }

    func endTimer() {
        if timeCounter == 29 {
            timer?.invalidate()
            timer = nil
            endGame()
            return
        }
        return
    }

    func endGame() {
        //1. add detailed info onto view about game ending, total score, score to beat, highest scores among all users, playAgainButton
        let endGameView = UIView()
        endGameView.backgroundColor = .yellow
        endGameView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height)
        endGameView.center.x = self.view.center.x

        let brandLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width/2))
        brandLabel.center.x = self.view.center.x
        brandLabel.center.y = self.view.center.y - 150
        brandLabel.text = "Swipe Swipe Revolution"
        brandLabel.font = UIFont(name: "AvenirNext-HeavyItalic", size: 40)
        brandLabel.numberOfLines = 0
        brandLabel.textAlignment = .center
        endGameView.addSubview(brandLabel)


        let totalScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/4))
        totalScoreLabel.backgroundColor = .white
        totalScoreLabel.center.x = self.view.center.x
        totalScoreLabel.center.y = self.view.center.y
        totalScoreLabel.text = "Your Score: \(scoreCounter)"
        totalScoreLabel.font = UIFont(name: "Avenir-Black", size: 20)
        totalScoreLabel.numberOfLines = 0
        totalScoreLabel.textAlignment = .center
        endGameView.addSubview(totalScoreLabel)

        //TO DO: Fix and enable playAgainButton
        let playAgainButton = UIButton(frame: CGRect(x: 0, y: 50, width: view.frame.width/2, height: view.frame.width/2))
        playAgainButton.center.x = self.view.center.x
        playAgainButton.center.y = self.view.center.y + view.frame.width/2
        playAgainButton.titleLabel?.text = "Play Again"
        playAgainButton.titleLabel?.textColor = .white
        playAgainButton.titleLabel?.textAlignment = .center
        playAgainButton.titleLabel?.numberOfLines = 0
        playAgainButton.backgroundColor = .green
//        endGameView.addSubview(playAgainButton)

        view.addSubview(endGameView)
        UIView.animate(withDuration: 1.0, delay: 0.1, options: .curveLinear, animations: {
            endGameView.frame.origin.y = 0
        }, completion: nil)
    }

    func fadeOutScorePlusOrMinusLabel() {
        // Fade in the view
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.scorePlusOrMinusLabel.alpha = 0
        }) { (Bool) -> Void in

            // After the animation completes, fade out the view after a delay
            UIView.animate(withDuration: 0.1, delay: 0.1, options: [.curveEaseOut], animations: { () -> Void in
                self.scoreLabel.text = "Score: \(self.scoreCounter)"
                self.scorePlusOrMinusLabel.alpha = 1
            }, completion: nil)
        }
    }

    func fadeDirectionLabel() {
        UIView.transition(with: directionLabel, duration: 0.1, options: .transitionFlipFromBottom, animations: { () -> Void in
            self.directionLabel.isHidden = true
        }) { (Bool) -> Void in
            UIView.transition(with: self.directionLabel, duration: 0.1,
                              options: .transitionFlipFromBottom,
                              animations: {
                                self.directionLabel.isHidden = false
            })
        }
    }
}

