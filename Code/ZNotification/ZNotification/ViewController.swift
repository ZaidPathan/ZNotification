//
//  ViewController.swift
//  ZNotification
//
//  Created by Zaid Pathan on 22/06/15.
//  Copyright (c) 2015 ZaidPathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var IBbtnStandartAlert: UIButton!
	@IBOutlet var IBbtnCustomAlert: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	
	@IBAction func IBActionShowStandardAlert(sender: UIButton) {
		ZNotification.show_Standard_Alert("No Internet available!", toView: self.view)
	}
	

	@IBAction func IBActionShowCustomAlert(sender: UIButton) {
		
		var message:String? = "LoggedIn successfylly"
		var bgColor:UIColor = UIColor.greenColor().colorWithAlphaComponent(0.75)
		var textColor:UIColor = UIColor.whiteColor()
		var font:UIFont = UIFont(name: "Papyrus",
			size: 15.0)!
		
		var animationComeTime:NSTimeInterval = 0.5
		var animationGoTime:NSTimeInterval = 0.5
		var animationHoldTime:NSTimeInterval = 1.0
		
		ZNotification.show_Custom_Alert(message!, bgColor: bgColor, textColor: textColor, font: font, comeTime:	animationComeTime, goTime: animationGoTime, holdTime: animationHoldTime, toView: self.view)
	}

	
	
	func configureView(){
		self.IBbtnCustomAlert.layer.borderColor = UIColor.whiteColor().CGColor
		self.IBbtnStandartAlert.layer.borderColor = UIColor.whiteColor().CGColor
		self.IBbtnCustomAlert.layer.borderWidth = 1.0
		self.IBbtnStandartAlert.layer.borderWidth = 1.0
	}
}

