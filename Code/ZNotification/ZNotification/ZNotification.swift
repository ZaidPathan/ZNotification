//
//  ZNotification.swift
//  ZNotification
//
//  Created by Zaid Pathan on 16/06/15.
//  Copyright (c) 2015 ZaidPathan. All rights reserved.
//

import Foundation
import UIKit

let DEVICE_WIDTH:CGFloat = UIScreen.main.bounds.size.width
let DEVICE_HEIGHT:CGFloat = UIScreen.main.bounds.size.height

class ZNotification {
	
	class func show_Standard_Alert(_ message:String,toView:UIView){
		show_Custom_Alert(message, bgColor: UIColor.black.withAlphaComponent(0.7), textColor: UIColor.white, font: UIFont(name: "HelveticaNeue-UltraLight",
			size: 15.0)!, comeTime: 0.5, goTime: 0.5, holdTime: 1, toView: toView)
	}
	
	
	class func show_Custom_Alert(_ message:String,bgColor:UIColor,textColor:UIColor,font:UIFont,comeTime:TimeInterval,goTime:TimeInterval,holdTime:TimeInterval,toView:UIView){
		
		let alertLabel:UILabel = UILabel()
		alertLabel.text = message
		alertLabel.backgroundColor = bgColor
		alertLabel.textColor = textColor
		alertLabel.font = font
		alertLabel.textAlignment = NSTextAlignment.center
		alertLabel.numberOfLines = 0
		alertLabel.minimumScaleFactor = 0.5
		toView.addSubview(alertLabel)
		
		
		//---------------------------------Start AutoLayout------------------------------------------
		
		alertLabel.translatesAutoresizingMaskIntoConstraints = false
		
        var metricsDictionary:[AnyHashable:Any] = [:]
		let viewsDictionary = ["alertLabel":alertLabel]
		
		
		//---------------------------------Pin left-right---------------------------------------------
		
		let view_constraint_H:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[alertLabel]-(0)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary) as NSArray
		toView.addConstraints(view_constraint_H as [AnyObject] as [AnyObject] as! [NSLayoutConstraint])
		toView.layoutIfNeeded()
		
		if(alertLabel.bounds.size.height < 30){
			metricsDictionary = ["labelNewHeight":alertLabel.bounds.size.height*4]
		}else{
			metricsDictionary = ["labelNewHeight":alertLabel.bounds.size.height*3]
		}
		//println(alertLabel.bounds.siz.height)
		
		
		//-------------------------------Set Initial height-------------------------------------------
		
		let view1_constraint_V:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:[alertLabel(labelNewHeight)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricsDictionary as? [String: Any], views: viewsDictionary)
		
		toView.addConstraints(view1_constraint_V)
		
		toView.layoutIfNeeded()
		
		//println(alertLabel.bounds.size.height)
		
		
		//--------------------------Set Label at negative height--------------------------------------
		
		metricsDictionary = ["topConstraint":-alertLabel.bounds.size.height]
		
		let view_constraint_V:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topConstraint)-[alertLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricsDictionary as? [String: Any], views: viewsDictionary)
		toView.addConstraints(view_constraint_V as [AnyObject] as! [NSLayoutConstraint])
		toView.layoutIfNeeded()
		toView.removeConstraints(view_constraint_V)
		
		metricsDictionary = ["topConstraint":alertLabel.bounds.size.height]
		let view_constraint_V_come:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[alertLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricsDictionary as? [String: Any], views: viewsDictionary)
		toView.addConstraints(view_constraint_V_come as [AnyObject] as! [NSLayoutConstraint])
		
		
		//-------------------------Animate Label to show notification--------------------------------------
		
		UIView.animate(withDuration: comeTime, animations: { () -> Void in
			toView.layoutIfNeeded()
			
			}, completion: { (value:Bool) -> Void in
				
				toView.removeConstraints(view_constraint_V_come)
				
				metricsDictionary = ["topConstraint":-alertLabel.bounds.size.height]
				let view_constraint_V_back:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topConstraint)-[alertLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricsDictionary as? [String: Any], views: viewsDictionary)
				toView.addConstraints(view_constraint_V_back as [AnyObject] as! [NSLayoutConstraint])
				
				
				//-------------------------Animate Label back from notification--------------------------------------
				
				UIView.animate(withDuration: goTime, delay: holdTime, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
					toView.layoutIfNeeded()
					}) { (value:Bool) -> Void in
						alertLabel.removeFromSuperview()
				}
		}) 
		
		
		
	}
	
}
