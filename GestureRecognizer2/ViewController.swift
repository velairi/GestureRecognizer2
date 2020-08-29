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

//        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerAction()), userInfo: nil, repeats: true)


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
                scorePlusOrMinusLabel.text = "+1"
                scorePlusOrMinusLabel.textColor = .green
            } else {
                scoreCounter -= 1
                scorePlusOrMinusLabel.text = "-1"
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
        scoreLabel.text = "Score: \(scoreCounter)"

        let randomIndex = Int.random(in: 0..<directions.count)
        directionLabel.text = directions[randomIndex]
    }

    @objc func timerAction() {
        timeCounter += 1
        timeLabel.text = "Time: \(timeCounter)"
    }
}
