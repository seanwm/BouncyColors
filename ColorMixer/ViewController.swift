//
//  ViewController.swift
//  ColorMixer
//
//  Created by Sean Mahan on 9/6/16.
//  Copyright © 2016 Intended Effect. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var brownView: UIView!
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var indigoView: UIView!
    
    @IBOutlet weak var mixerView: MixerView!
    
    @IBOutlet weak var leftStackView: UIStackView!
    //@IBOutlet weak var colorPile: UIStackView!
    @IBOutlet weak var rightStackView: UIStackView!
    
    var colorBuckets = [UIView]()
    
    var lastColorName = ""
    
    var colorBasket = [UIColor]()
    var basketBehaviors = [UIDynamicItemBehavior]()
    
    var animator: UIDynamicAnimator!
//    var masterAnimator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var gravity2: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var mixerCollision: UICollisionBehavior!
    var motionManager: CMMotionManager!
    var snap: UISnapBehavior!
    var attachmentBehavior: UIAttachmentBehavior!

    var mixerHalfWidth : CGFloat = 200
    
    var hasCollision = false
    
    let speechSynthesizer = AVSpeechSynthesizer()
    let colorHelper = ColorHelper()
    
    let colorBallSize : CGFloat = 80

    override func viewDidLayoutSubviews() {
        for colorView in leftStackView.arrangedSubviews
        {
            roundify(view: colorView)
        }
        for colorView in rightStackView.arrangedSubviews
        {
            roundify(view: colorView)
        }
        
        roundify(view: orangeView)
        roundify(view: purpleView)
        
    }
    
    func roundify(view:UIView)
    {
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.width / 2.0
        view.layer.masksToBounds = true
        view.clipsToBounds = true
    }
    
    /*override var shouldAutorotate : Bool
    {
        get{
            return false
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        get{
            return UIInterfaceOrientationMask.portrait
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBuckets = [redView, orangeView, yellowView, greenView, blueView, purpleView, blackView, whiteView, pinkView, brownView, greyView, indigoView]
        
        
        
        if (self.view.bounds.width < 600)
        {
            mixerHalfWidth = 100
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        mixerView.layer.borderWidth = 4
        mixerView.layer.borderColor = UIColor.black.cgColor
        mixerView.layer.cornerRadius = mixerHalfWidth
        
        mixerView.center = self.view.center

        animator = UIDynamicAnimator(referenceView: mixerView)

        gravity = UIGravityBehavior()
        gravity.magnitude = 2.0
        animator.addBehavior(gravity)
        collision = UICollisionBehavior()

        let myBezierPath = UIBezierPath(arcCenter: CGPoint(x:mixerHalfWidth, y:mixerHalfWidth), radius: mixerHalfWidth, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)

        collision.addBoundary(withIdentifier: "CoolCircle" as NSCopying, for: myBezierPath)
        animator.addBehavior(collision)
        
        motionManager = CMMotionManager()
        
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
            let rotation = atan2(data!.gravity.y, -1 * data!.gravity.x) - M_PI
            self.gravity.angle = CGFloat(rotation)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchColor(sender: UITapGestureRecognizer) {

        
        if (hasCollision == false)
        {
            let myBezierPath = UIBezierPath(arcCenter: CGPoint(x:mixerHalfWidth, y:mixerHalfWidth), radius: mixerHalfWidth, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)
            
            collision.addBoundary(withIdentifier: "CoolCircle" as NSCopying, for: myBezierPath)
            animator.addBehavior(collision);
        }
        
        var colorToAdd : UIColor? = nil
        
        colorToAdd = sender.view?.backgroundColor
                
        if (colorToAdd != nil)
        {
            colorBasket.append(colorToAdd!)
        }
        
        let newColorView = OneColorView()
        
        self.view.addSubview(newColorView)
        //colorPile.backgroundColor = UIColor.clear
        
        newColorView.backgroundColor = colorToAdd
        var superCenter : CGPoint = sender.view!.center
        
        if (sender.view!.superview! is UIStackView)
        {
            superCenter = self.view.convert(superCenter, from: sender.view!.superview!)
        }
        newColorView.frame = CGRect(x: superCenter.x, y: superCenter.y, width: colorBallSize, height: colorBallSize)
        let heightConstr = newColorView.heightAnchor.constraint(lessThanOrEqualToConstant: colorBallSize)
        heightConstr.priority = UILayoutPriorityDefaultLow
        heightConstr.isActive = true
        
        let widthConstr = newColorView.widthAnchor.constraint(lessThanOrEqualToConstant: colorBallSize)
        widthConstr.priority = UILayoutPriorityDefaultLow
        widthConstr.isActive = true
        
        newColorView.layer.cornerRadius = colorBallSize / 2
        newColorView.layer.masksToBounds = true

        newColorView.layer.borderWidth = 2
        newColorView.layer.borderColor = UIColor.black.cgColor

        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            
            newColorView.frame.origin.y = self.mixerView.center.y
            newColorView.frame.origin.x = self.mixerView.center.x
            
            }, completion: { finished in
                newColorView.removeFromSuperview()
                newColorView.frame.origin.y = self.mixerHalfWidth
                    newColorView.frame.origin.x = self.mixerHalfWidth
                self.mixerView.addSubview(newColorView);
                
                let itemBehaviour = UIDynamicItemBehavior(items: [newColorView])
                itemBehaviour.elasticity = 0.8
                itemBehaviour.density = 50
                itemBehaviour.friction = 0.1
                itemBehaviour.angularResistance = 0.5
                self.animator.addBehavior(itemBehaviour)
                self.basketBehaviors.append(itemBehaviour)
                
                self.collision.addItem(newColorView);
                self.gravity.addItem(newColorView);
                
                if (self.colorBasket.count>=20)
                {
                    self.explode()
                }
        })
        
        
        let newColor = colorHelper.calculateMixedColor(colorBasket: self.colorBasket)
        
        
        mixerView.backgroundColor = newColor
        
        let colorName = colorHelper.nameFor(color:newColor)
        
        if (colorName != lastColorName)
        {
            let speechUtterance = AVSpeechUtterance(string: colorName)
        
            speechSynthesizer.speak(speechUtterance)
            lastColorName = colorName
        }

/*        */
        

    }
        
    
    @IBAction func touchMixer(sender: UITapGestureRecognizer) {
        mixerView.backgroundColor = colorHelper.calculateMixedColor(colorBasket: self.colorBasket)
    }
    
    func explode()
    {
        colorBasket.removeAll(keepingCapacity: false)
        
        animator.removeBehavior(collision)
        for colorView in mixerView.subviews {
            let push = UIPushBehavior(items: [colorView], mode: .instantaneous)
            push.angle = CGFloat(-1.35) * CGFloat(arc4random())// arc4random_uniform(
            push.magnitude = 1.50
            animator?.addBehavior(push)
            
            //colorView.removeFromSuperview()
        }
        for behavior in basketBehaviors{
            animator.removeBehavior(behavior)
        }
        
        basketBehaviors.removeAll(keepingCapacity: false)
        
        mixerView.backgroundColor = UIColor.clear
        
        hasCollision = false;

    }

    @IBAction func touchEmpty(_ sender: AnyObject) {
        explode()
    }
}
