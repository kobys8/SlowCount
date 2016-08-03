//
//  ViewController.swift
//  SlowCount
//
//  Created by Koby Samuel on 12/1/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var theCount: UILabel!
	var count: Int = 0
	var counterTask: UIBackgroundTaskIdentifier!
	var theTimer: NSTimer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		counterTask = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
			() -> Void in
			// Code to finish any procedures that might take about (or less than) 10 minutes
		})
		theTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "countUp", userInfo: nil, repeats: true)
	}
	
	func countUp() {
		if(count == 1000) {
			theTimer.invalidate()
			UIApplication.sharedApplication().endBackgroundTask(counterTask)
		}
		else {
			count++
			theCount.text = "\(count)"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

