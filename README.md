OS support: iOS 7.0+<br>
Device support: iPhone,iPod and iPads<br>
Orientation support: Both (Landscape portrait)


ZNotification is inspired by many social apps.<br>
-You should use this components if you want to show notification inside you app.<br>
-For example: show no internet connection alert, wrong username-password alert etc.<br>
-This component is very easy to use and free.<br>
-The advantage of this alert is that, it is created in Swift and using autolayout, so it will work in universal device and both orientations.<br>


Easy to use:

<b>1. Add ZNotification.swift file into you project</b><br>
-Then use these both methods according to your requirements.

<b>2. Show Standard alert (Many social apps like):</b>

		ZNotification.show_Standard_Alert("No Internet available!", toView: self.view)
		//In toView write you ViewController's main view.
		
![StandardAlert](https://raw.githubusercontent.com/ZaidPathan/ZNotification/master/Docs/Screenshots/iOS%20Simulator%20Screen%20Shot%2023-Jun-2015%2010.25.38%20am.png)
		
		
<b>3. Show Custom alert:</b>

		var message:String? = "Something went wrong ,please try after sometime."
		var bgColor:UIColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
		var textColor:UIColor = UIColor.whiteColor()
		var font:UIFont = UIFont(name: "Copperplate",size: 15.0)!
		
		var animationComeTime:NSTimeInterval = 0.5
		var animationGoTime:NSTimeInterval = 0.5
		var animationHoldTime:NSTimeInterval = 1.0
		
		ZNotification.show_Custom_Alert(message!, bgColor: bgColor, textColor: textColor, font: font, comeTime:	animationComeTime, goTime: animationGoTime, holdTime: animationHoldTime, toView: self.view)
		//In toView write you ViewController's main view.
		


![CustomAlert1](https://raw.githubusercontent.com/ZaidPathan/ZNotification/master/Docs/Screenshots/iOS%20Simulator%20Screen%20Shot%2023-Jun-2015%2010.26.16%20am.png)

![CustomAlert2](https://raw.githubusercontent.com/ZaidPathan/ZNotification/master/Docs/Screenshots/iOS%20Simulator%20Screen%20Shot%2023-Jun-2015%2010.32.19%20am.png)
