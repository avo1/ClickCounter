//
//  ViewController.swift
//  ClickCounter
//
//  Created by Dave Vo on 10/16/15.
//  Copyright © 2015 DaveVo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var clickButton: UIButton!
    var count = 0
    
    @IBOutlet weak var colorBox: UILabel!
    @IBOutlet weak var colorBox2: UILabel!
    
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a label
        let label = UILabel()
        label.frame = CGRectMake(50, 50, 100, 50)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        
        // Create a button
        let myButton = UIButton(frame: CGRectMake(200, 50, 100, 50))
        myButton.setTitle("Click Me", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        myButton.layer.borderColor = UIColor.redColor().CGColor
        myButton.layer.borderWidth = 3
        self.view.addSubview(myButton)
        
        myButton.addTarget(self, action: "addOne", forControlEvents: UIControlEvents.TouchUpInside)
        self.clickButton = myButton
        
        // Init the colorBox
        colorBox.layer.borderWidth = 2
        colorBox.layer.borderColor = UIColor.blackColor().CGColor
        colorBox.backgroundColor = UIColor.blackColor()
        
        // Init 2 switches to off
        redSwitch.on = false
        blueSwitch.on = false
        greenSwitch.on = false
        
        // Init colorBox 2 (used for sliders)
        colorBox2.layer.borderWidth = 2
        colorBox2.layer.borderColor = UIColor.blackColor().CGColor
        colorBox2.backgroundColor = UIColor.blackColor()
        
        // Reset value of sliders to 1
        redSlider.setValue(1.0, animated: false)
        greenSlider.setValue(1.0, animated: false)
        blueSlider.setValue(1.0, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addOne() {
        self.label.text = "\(++count)"
        if count % 2 == 0 {
            self.clickButton.backgroundColor = UIColor.blueColor()
        } else {
            self.clickButton.backgroundColor = UIColor.greenColor()
        }
        
    }
    
    @IBAction func changeColor(sender: UISwitch) {
        let r: CGFloat = redSwitch.on ? 1 : 0
        let g: CGFloat = greenSwitch.on ? 1 : 0
        let b: CGFloat = blueSwitch.on ? 1 : 0
        
        colorBox.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    @IBAction func changeColorbySlider(sender: AnyObject) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        
        colorBox2.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    @IBAction func experiment(sender: UIButton) {
        let nextController = UIImagePickerController()
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    @IBAction func showActivities(sender: UIButton) {
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    @IBAction func showAlertView(sender: UIButton) {
        let alertMessage = UIAlertController()
        alertMessage.title = "this is alert title"
        alertMessage.message = "brown & cony"
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertMessage.addAction(okAction)
        self.presentViewController(alertMessage, animated: true, completion: nil)
        
    }
    
}

