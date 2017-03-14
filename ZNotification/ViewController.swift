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
	
	
	@IBAction func IBActionShowStandardAlert(_ sender: UIButton) {
		ZNotification.show_Standard_Alert("No Internet available!", toView: self.view)
	}
	

	@IBAction func IBActionShowCustomAlert(_ sender: UIButton) {
		
		var message:String? = "LoggedIn successfylly"
		var bgColor:UIColor = UIColor.green.withAlphaComponent(0.75)
		var textColor:UIColor = UIColor.white
		var font:UIFont = UIFont(name: "Papyrus",
			size: 15.0)!
		
		var animationComeTime:TimeInterval = 0.5
		var animationGoTime:TimeInterval = 0.5
		var animationHoldTime:TimeInterval = 1.0
		
		ZNotification.show_Custom_Alert(message!, bgColor: bgColor, textColor: textColor, font: font, comeTime:	animationComeTime, goTime: animationGoTime, holdTime: animationHoldTime, toView: self.view)
	}

	
	
	func configureView(){
		self.IBbtnCustomAlert.layer.borderColor = UIColor.white.cgColor
		self.IBbtnStandartAlert.layer.borderColor = UIColor.white.cgColor
		self.IBbtnCustomAlert.layer.borderWidth = 1.0
		self.IBbtnStandartAlert.layer.borderWidth = 1.0
	}
}

