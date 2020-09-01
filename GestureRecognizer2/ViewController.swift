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
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

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
        fadeDirectionLabelOutThenIn()
    }

    @objc func timerAction() {
        timeCounter += 1
        timeLabel.text = "Time: \(timeCounter)"
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

    func fadeDirectionLabelOutThenIn() {
        let animationDuration = 0.1

        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.directionLabel.alpha = 0
        }) { (Bool) -> Void in

            // After the animation completes, fade out the view after a delay
            UIView.animate(withDuration: animationDuration, delay: 0.1, options: [.curveEaseOut], animations: { () -> Void in
                let randomIndex = Int.random(in: 0..<self.directions.count)
                self.directionLabel.text = self.directions[randomIndex]
                self.directionLabel.alpha = 1
            }, completion: nil)
        }
    }
}

