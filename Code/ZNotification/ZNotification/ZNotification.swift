//
//  ZNotification.swift
//  ZNotification
//
//  Created by Zaid Pathan on 16/06/15.
//  Copyright (c) 2015 ZaidPathan. All rights reserved.
//

import Foundation
import UIKit

let DEVICE_WIDTH:CGFloat = UIScreen.mainScreen().bounds.size.width
let DEVICE_HEIGHT:CGFloat = UIScreen.mainScreen().bounds.size.height

class ZNotification {
	
	class func show_Standard_Alert(message:String,toView:UIView){
		show_Custom_Alert(message, bgColor: UIColor.blackColor().colorWithAlphaComponent(0.7), textColor: UIColor.whiteColor(), font: UIFont(name: "HelveticaNeue-UltraLight",
			size: 15.0)!, comeTime: 0.5, goTime: 0.5, holdTime: 1, toView: toView)
	}
	
	
	class func show_Custom_Alert(message:String,bgColor:UIColor,textColor:UIColor,font:UIFont,comeTime:NSTimeInterval,goTime:NSTimeInterval,holdTime:NSTimeInterval,toView:UIView){
		
		var alertLabel:UILabel = UILabel()
		alertLabel.text = message
		alertLabel.backgroundColor = bgColor
		alertLabel.textColor = textColor
		alertLabel.font = font
		alertLabel.textAlignment = NSTextAlignment.Center
		alertLabel.numberOfLines = 0
		alertLabel.minimumScaleFactor = 0.5
		toView.addSubview(alertLabel)
		
		
		//---------------------------------Start AutoLayout------------------------------------------
		
		alertLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var metricsDictionary = [:]
		let viewsDictionary = ["alertLabel":alertLabel]
		
		
		//---------------------------------Pin left-right---------------------------------------------
		
		let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[alertLabel]-(0)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		toView.addConstraints(view_constraint_H as [AnyObject])
		toView.layoutIfNeeded()
		
		if(alertLabel.bounds.size.height < 30){
			metricsDictionary = ["labelNewHeight":alertLabel.bounds.size.height*4]
		}else{
			metricsDictionary = ["labelNewHeight":alertLabel.bounds.size.height*3]
		}
		//println(alertLabel.bounds.siz.height)
		
		
		//-------------------------------Set Initial height-------------------------------------------
		
		let view1_constraint_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[alertLabel(labelNewHeight)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary as [NSObject : AnyObject], views: viewsDictionary)
		
		toView.addConstraints(view1_constraint_V)
		
		toView.layoutIfNeeded()
		
		//println(alertLabel.bounds.size.height)
		
		
		//--------------------------Set Label at negative height--------------------------------------
		
		metricsDictionary = ["topConstraint":-alertLabel.bounds.size.height]
		
		let view_constraint_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(topConstraint)-[alertLabel]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary as [NSObject : AnyObject], views: viewsDictionary)
		toView.addConstraints(view_constraint_V as [AnyObject])
		toView.layoutIfNeeded()
		toView.removeConstraints(view_constraint_V)
		
		metricsDictionary = ["topConstraint":alertLabel.bounds.size.height]
		let view_constraint_V_come:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[alertLabel]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary as [NSObject : AnyObject], views: viewsDictionary)
		toView.addConstraints(view_constraint_V_come as [AnyObject])
		
		
		//-------------------------Animate Label to show notification--------------------------------------
		
		UIView.animateWithDuration(comeTime, animations: { () -> Void in
			toView.layoutIfNeeded()
			
			}) { (value:Bool) -> Void in
				
				toView.removeConstraints(view_constraint_V_come)
				
				metricsDictionary = ["topConstraint":-alertLabel.bounds.size.height]
				let view_constraint_V_back:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(topConstraint)-[alertLabel]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary as [NSObject : AnyObject], views: viewsDictionary)
				toView.addConstraints(view_constraint_V_back as [AnyObject])
				
				
				//-------------------------Animate Label back from notification--------------------------------------
				
				UIView.animateWithDuration(goTime, delay: holdTime, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
					toView.layoutIfNeeded()
					}) { (value:Bool) -> Void in
						alertLabel.removeFromSuperview()
				}
		}
		
		
		
	}
	
}