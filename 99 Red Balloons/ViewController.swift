//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Scott Brady on 10/25/14.
//  Copyright (c) 2014 Spider Monkey Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!

	let totalBalloons = 99
	var balloons:[Balloon] = []
	var currentIndex = -1

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		initializeBalloons()
		showNextBalloon()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func pressedNext(sender: UIBarButtonItem) {
		showNextBalloon()
	}

	func initializeBalloons() {
		var balloon = Balloon()

		for var i = 0; i < self.totalBalloons; ++i {
			balloon.number = i + 1
			var randomNumber = Int(arc4random_uniform(UInt32(4)))
			balloon.image = UIImage(named: "RedBalloon\(randomNumber + 1).jpg")
			self.balloons.append(balloon)
		}
	}

	func showNextBalloon() {
		self.currentIndex++
		if (self.currentIndex == self.totalBalloons){
			self.currentIndex = 0
		}

		println("\(self.currentIndex)")
		let balloon = balloons[self.currentIndex]

		UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
			{
				self.imageView.image = balloon.image
				self.numberLabel.text = "Balloon \(balloon.number)"
			}, completion:
			{
				(finished: Bool) -> () in
			}
		)
	}

}

