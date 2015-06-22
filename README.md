OS support: iOS 7.0+<br>
Device support: iPhone,iPod and iPads<br>
Orientation support: Both (Landscape portrait)


ZNotification is inspired by one of the famous social app Brabble.<br>
-You should use this components if you want to show notification inside you app.<br>
-For example: show no internet connection alert, wrong username-password alert etc.<br>
-This component is very easy to use and free.<br>
-The advantage of this alert is that, it is created in Swift and using autolayout, so it will work in universal device and both orientations.<br>


Easy to use:

<b>1. Add ZNotification.swift file into you project</b><br>
-Then use these both methods according to your requirements.

<b>2. Show Standard alert (Brabble app like):</b>

		ZNotification.show_Standard_Alert("No Internet available!", toView: self.view)
		//In toView write you ViewController's main view.
		
![StandardAlert](https://www.dropbox.com/s/159ek0btnot0hgq/iOS%20Simulator%20Screen%20Shot%2022-Jun-2015%202.11.16%20pm.png?dl=0)
		
		
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
		
![CustomAlert1](https://www.dropbox.com/s/ss5fmdyz2jyrsl8/iOS%20Simulator%20Screen%20Shot%2022-Jun-2015%202.11.18%20pm.png?dl=0)

![CustomAlert2](https://www.dropbox.com/s/mshqwcdwe547mhq/iOS%20Simulator%20Screen%20Shot%2022-Jun-2015%202.18.15%20pm.png?dl=0)

![CustomAlert3](https://www.dropbox.com/s/fcpvxb8h5cdtmjf/iOS%20Simulator%20Screen%20Shot%2022-Jun-2015%202.20.13%20pm.png?dl=0)
