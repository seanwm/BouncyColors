//
//  ViewController.swift
//  ColorMixer
//
//  Created by Sean Mahan on 9/6/16.
//  Copyright © 2016 Intended Effect. All rights reserved.
//

import UIKit
import CoreMotion


@objc protocol  UIColorPrivate {
    func styleString() -> String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var mixerView: MixerView!
    
    //@IBOutlet weak var colorPile: UIStackView!
    
    var colorBasket = [UIColor]()
    
    var animator: UIDynamicAnimator!
//    var masterAnimator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var gravity2: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var mixerCollision: UICollisionBehavior!
    var motionManager: CMMotionManager!
    var snap: UISnapBehavior!
    var attachmentBehavior: UIAttachmentBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mixerView.layer.borderWidth = 4
        mixerView.layer.borderColor = UIColor.black.cgColor
        mixerView.layer.cornerRadius = 200
        
        mixerView.center = self.view.center

        whiteView.layer.borderWidth = 4
        whiteView.layer.borderColor = UIColor.black.cgColor
        whiteView.layer.cornerRadius = 1.0;
        whiteView.clipsToBounds = true;
        
        animator = UIDynamicAnimator(referenceView: mixerView)

        gravity = UIGravityBehavior()//items:[mixerView])
        //gravity.magnitude = 0.1
        animator.addBehavior(gravity)
        collision = UICollisionBehavior() //items:[mixerView]
        //collision.translatesReferenceBoundsIntoBoundary = true


        let myBezierPath = UIBezierPath(arcCenter: CGPoint(x:200, y:200), radius: 200, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)

        collision.addBoundary(withIdentifier: "CoolCircle" as NSCopying, for: myBezierPath)
        animator.addBehavior(collision)
        
        mixerView.center = self.view.center
        /*motionManager = CMMotionManager()
        
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler:{
            deviceManager, error in
            if (error != nil) {
                NSLog("\(error)")
            }
            
            let grav : CMAcceleration = deviceManager!.gravity;
            
            let x = CGFloat(grav.x);
            let y = CGFloat(grav.y);
            
            var v = CGVector()// CGVectorMake(x, y);
            v.dx = x
            v.dy = y
            self.gravity.gravityDirection = v;
        })*/

    }
/*    override func viewDidAppear(_ animated: Bool) {
        let itemBehaviour = UIDynamicItemBehavior(items: [mixerView])
        itemBehaviour.isAnchored = true
        animator.addBehavior(itemBehaviour)
    }
*/    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchColor(sender: UITapGestureRecognizer) {

        var colorToAdd : UIColor? = nil
        
        colorToAdd = sender.view?.backgroundColor
        
        if (colorToAdd != nil)
        {
            colorBasket.append(colorToAdd!)
        }
        
        let newColorView = OneColorView()
        
        //colorPile.backgroundColor = UIColor.clear
        
        newColorView.backgroundColor = colorToAdd
        newColorView.frame = CGRect(x: mixerView.frame.width/2.0 + CGFloat(mixerView.subviews.count), y: 100, width: 36, height: 36)
        let heightConstr = newColorView.heightAnchor.constraint(lessThanOrEqualToConstant: 36.0)
        heightConstr.priority = UILayoutPriorityDefaultLow
        heightConstr.isActive = true
        
        let widthConstr = newColorView.widthAnchor.constraint(lessThanOrEqualToConstant: 36.0)
        widthConstr.priority = UILayoutPriorityDefaultLow
        widthConstr.isActive = true
        
        newColorView.layer.cornerRadius = 18.0
        newColorView.layer.masksToBounds = true

        newColorView.layer.borderWidth = 2
        newColorView.layer.borderColor = UIColor.black.cgColor

        mixerView.addSubview(newColorView);
        
        let itemBehaviour = UIDynamicItemBehavior(items: [newColorView])
        itemBehaviour.elasticity = 0.8
        itemBehaviour.density = 50
        itemBehaviour.friction = 0.1
        itemBehaviour.angularResistance = 0.5
        animator.addBehavior(itemBehaviour)
        
        gravity.addItem(newColorView);
        collision.addItem(newColorView);
        
        mixerView.backgroundColor = calculateMixedColor()
/*        let push = UIPushBehavior(items: [newColorView], mode: .instantaneous)
        push.angle = -1.35
        push.magnitude = 1.56
        animator?.addBehavior(push)*/
        

    }
    
    func toCMYK(red:Float, green:Float, blue:Float) -> [Float]
    {
        let k: Float = min(255-red,min(255-green,255-blue))
        let c: Float = 255*(255-red-k)/(255-k)
        let m: Float = 255*(255-green-k)/(255-k)
        let y: Float = 255*(255-blue-k)/(255-k)
    
        var cmyk = [Float]()
        cmyk.append(c.isNaN ? 0 : c)
        cmyk.append(m.isNaN ? 0 : m)
        cmyk.append(y.isNaN ? 0 : y)
        cmyk.append(k.isNaN ? 0 : k)
        return cmyk
    }
    
    func toRGB(c:Float, m:Float, y:Float, k:Float) -> [Float]
    {
        var rgb = [Float]()
        rgb.append(-((c * (255-k)) / 255 + k - 255))
        rgb.append(-((m * (255-k)) / 255 + k - 255))
        rgb.append(-((y * (255-k)) / 255 + k - 255))
        return rgb
    }
    
    func calculateMixedColor()->UIColor
    {
        var cyans = [Float]()
        var magentas = [Float]()
        var yellows = [Float]()
        var blacks = [Float]()
        
        for color in colorBasket
        {
            var rcRed : CGFloat = 0
            var rcGreen : CGFloat = 0
            var rcBlue : CGFloat = 0
            var rcAlpha : CGFloat = 0
            
            color.getRed(&rcRed, green: &rcGreen, blue: &rcBlue, alpha: &rcAlpha)
            
            let colorPrivate = unsafeBitCast(color, to: UIColorPrivate.self)
            
            //let space = color.cgColor.colorSpace
            
            rcRed = rcRed * 255;
            rcGreen = rcGreen * 255;
            rcBlue = rcBlue * 255;
            
            let styleStr = colorPrivate.styleString() // rgb(255,255,255)
            
            let strRGB = styleStr.components(separatedBy: ",")
            
            var strRed = strRGB[0]
            strRed = strRed[strRed.index(strRed.startIndex, offsetBy: 4)..<strRed.endIndex]
            
            var strGreen = strRGB[1]
            strGreen = strGreen[strGreen.startIndex..<strGreen.endIndex]
            
            var strBlue = strRGB[2]
            strBlue = strBlue[strBlue.startIndex..<strBlue.index(strBlue.endIndex, offsetBy:-1)]
            
            var fltRed = Float(strRed)
            var fltGreen = Float(strGreen)
            var fltBlue = Float(strBlue)
            
            if (fltRed != nil && fltRed! > 255)
            {
                fltRed = 255;
            }
            if (fltGreen != nil && fltGreen! > 255)
            {
                fltGreen = 255;
            }
            if (fltBlue != nil && fltBlue! > 255)
            {
                fltBlue = 255;
            }
            
            if (fltRed == nil || fltRed! < 0)
            {
                fltRed = 0;
            }
            if (fltGreen == nil || fltGreen! < 0)
            {
                fltGreen = 0;
            }
            if (fltBlue == nil || fltBlue! < 0)
            {
                fltBlue = 0;
            }
            
            let cmyk = toCMYK(red: fltRed!, green: fltGreen!, blue: fltBlue!)
            
            cyans.append(cmyk[0])
            magentas.append(cmyk[1])
            yellows.append(cmyk[2])
            blacks.append(cmyk[3])
            /*reds.append(rcRed)
             greens.append(rcGreen)
             blues.append(rcBlue)
             alphas.append(0.5)*/
        }
        /*
         let finalRed = Float(reds.reduce(0, +)) / Float(reds.count)
         let finalGreen = Float(greens.reduce(0, +)) / Float(greens.count)
         let finalBlue = Float(blues.reduce(0, +)) / Float(blues.count)
         */
        /*let finalRed = Float(reds.reduce(0, +)) / Float(reds.count+1) //Float(reds.reduce(0, +)) / Float(reds.count)
         let finalGreen = Float(greens.reduce(0, +)) / Float(greens.count+1) //Float(greens.reduce(0, +)) / Float(greens.count)
         let finalBlue = Float(blues.reduce(0, +)) / Float(blues.count+1) //Float(blues.reduce(0, +)) / Float(blues.count)*/
        
        let finalCyan = Float(cyans.reduce(0, +))/Float(cyans.count)
        let finalMagenta = Float(magentas.reduce(0, +))/Float(cyans.count)
        let finalYellow = Float(yellows.reduce(0, +))/Float(cyans.count)
        let finalBlack = Float(blacks.reduce(0, +))/Float(cyans.count)
        
        var finalRGB = toRGB(c: finalCyan, m: finalMagenta, y: finalYellow, k: finalBlack)
        
        return UIColor(
            colorLiteralRed: finalRGB[0]/255,
            green: finalRGB[1]/255,
            blue: finalRGB[2]/255,
            alpha: 1.0)

    }
    
    @IBAction func touchMixer(sender: UITapGestureRecognizer) {
        mixerView.backgroundColor = calculateMixedColor()
    }

    @IBAction func touchEmpty(_ sender: AnyObject) {
        colorBasket.removeAll(keepingCapacity: false)
        
        for colorView in mixerView.subviews {
            colorView.removeFromSuperview()
//            mixerView.willRemoveSubview(colorView)
        }
        
        mixerView.backgroundColor = UIColor.clear
    }
}
