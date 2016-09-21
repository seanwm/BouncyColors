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

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
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
    
    @IBOutlet weak var colorNameLabel: UILabel!
    var colorBuckets = [UIView]()
    
    var lastColorName = ""
    
    var circlePath : UIBezierPath?
    var innerCirclePath : UIBezierPath?
    
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

    //var ballBallSound : AVAudioPlayer?
    var ballWallSound : AVAudioPlayer?
    //var pewSound : AVAudioPlayer?
    var pewSound: SystemSoundID = 0
    var ballBallSound: SystemSoundID = 0
    var explosionSound : AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?

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
        
        view.setNeedsLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        colorHelper.printStuff()
        
/*        leftStackView.isOpaque = true
        leftStackView.setNeedsLayout()
        leftStackView.layoutIfNeeded()
        redView.setNeedsDisplay()
        redView.setNeedsLayout()*/
    }
    
    func roundify(view:UIView)
    {
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.width / 2.0
        view.layer.masksToBounds = true
        view.clipsToBounds = true
    }
    
    override var shouldAutorotate : Bool
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorBuckets = [redView, orangeView, yellowView, greenView, blueView, purpleView, blackView, whiteView, pinkView, brownView, greyView, indigoView]
        
        
        
        if (self.view.bounds.width < 600)
        {
            mixerHalfWidth = 100
        }
        
        for colorView in leftStackView.subviews
        {
            roundify(view: colorView)
        }
        for colorView in rightStackView.arrangedSubviews
        {
            roundify(view: colorView)
        }

        
        // Do any additional setup after loading the view, typically from a nib.
        mixerView.layer.borderWidth = 4
        mixerView.layer.borderColor = UIColor.black.cgColor
        mixerView.layer.cornerRadius = mixerHalfWidth
        
        mixerView.center = self.view.center

        animator = UIDynamicAnimator(referenceView: self.view)

        gravity = UIGravityBehavior()
        gravity.magnitude = 2.0
        animator.addBehavior(gravity)
        
        circlePath = UIBezierPath(arcCenter: /*CGPoint(x:mixerHalfWidth, y:mixerHalfWidth)*/ self.mixerView.center, radius: mixerHalfWidth, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)
        
        innerCirclePath = UIBezierPath(arcCenter: /*CGPoint(x:mixerHalfWidth, y:mixerHalfWidth)*/ self.mixerView.center, radius: mixerHalfWidth - 20, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)

        setupCollision()
        
        motionManager = CMMotionManager()
        
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
            let rotation = atan2(data!.gravity.y, -1 * data!.gravity.x) - M_PI
            self.gravity.angle = CGFloat(rotation)
        })
        
        //ballBallSound = setupAudioPlayerWithFile(file: "click", type: "wav")
        //pewSound = setupAudioPlayerWithFile(file: "pew2", type: "wav")
        explosionSound = setupAudioPlayerWithFile(file: "explode1", type: "wav")
        
        if let soundURL = Bundle.main.url(forResource: "pew2", withExtension: "wav") {
            
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &pewSound)
        }
        if let soundURL = Bundle.main.url(forResource: "click", withExtension: "wav") {
            
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &ballBallSound)
        }
    }
    
    func setupCollision()
    {
        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        collision.addBoundary(withIdentifier: "CoolCircle" as NSCopying, for: circlePath!)
        animator.addBehavior(collision)

        hasCollision = true
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = Bundle.main.path(forResource: file as String, ofType: type as String)
        let url = NSURL.fileURL(withPath: path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
    /*func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        //print("Boundary contact occurred - \(identifier)")
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        //ballBallSound?.play()
        //AudioServicesPlaySystemSound(ballBallSound)
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchColor(sender: UITapGestureRecognizer)
    {
        AudioServicesPlaySystemSound(pewSound);
        
        if (hasCollision == false)
        {
            setupCollision()
            /*
            collision.addBoundary(withIdentifier: "CoolCircle" as NSCopying, for: circlePath!)
            animator.addBehavior(collision);
            hasCollision = true*/
        }
        
        var colorToAdd : UIColor? = nil
        
        colorToAdd = sender.view?.backgroundColor
                
        if (colorToAdd != nil)
        {
            colorBasket.append(colorToAdd!)
        }
        
        let newColorView = OneColorView()
        
        self.mixerView.addSubview(newColorView)
        //colorPile.backgroundColor = UIColor.clear
        
        newColorView.backgroundColor = colorToAdd
        var superCenter : CGPoint = sender.view!.center
        
        if (sender.view!.superview! is UIStackView)
        {
            superCenter = self.view.convert(superCenter, from: sender.view!.superview!)
        }
        let placementCenter = self.mixerView.convert(superCenter, from: self.view)
        newColorView.frame = CGRect(x: placementCenter.x, y: placementCenter.y, width: colorBallSize, height: colorBallSize)
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

        let originPoint = superCenter
        let destinationPoint = self.mixerView.center
        
        let deltaY = destinationPoint.y - originPoint.y
        let deltaX = destinationPoint.x - originPoint.x
        
//        angleInDegrees = arctan(deltaY / deltaX) * 180 / PI
//        If your language includes an atan2 function it becomes the following instead:
        
        let angleInDegrees = atan2(deltaY, deltaX) * 180 / CGFloat(M_PI)
        let angleInRadians = angleInDegrees * CGFloat(M_PI / 180)
        
        let push = UIPushBehavior(items: [newColorView], mode: .instantaneous)
        push.angle = angleInRadians
        push.magnitude = 40
        animator?.addBehavior(push)

        let itemBehaviour = UIDynamicItemBehavior(items: [newColorView])
        itemBehaviour.elasticity = 0.5
        itemBehaviour.density = 1
        itemBehaviour.friction = 0.0
        itemBehaviour.resistance = 0.1
        itemBehaviour.angularResistance = 0.0
        
        itemBehaviour.action = {
            let convertedPoint = self.view.convert(newColorView.center, from: self.mixerView)
  //          let distance = hypotf(Float(self.mixerView.center.x - newColorView.center.x), Float(self.mixerView.center.y - newColorView.center.y))

            //if self.mixerView.frame.contains(newColorView.frame) {
//            if (CGFloat(distance) < self.mixerHalfWidth){
            if (self.innerCirclePath!.contains(convertedPoint)){
                self.collision.addItem(newColorView);
                itemBehaviour.action = nil
            }
            
            if (!self.view.frame.contains(convertedPoint))
            {
                itemBehaviour.action = nil
                self.gravity.removeItem(newColorView)
                newColorView.removeFromSuperview()
            }
            
            if (self.colorBasket.count>=20)
            {
                self.explode()
            }

        }

        self.animator.addBehavior(itemBehaviour)
        self.basketBehaviors.append(itemBehaviour)
        
        self.gravity.addItem(newColorView);
        
        let newColor = colorHelper.calculateMixedColor(colorBasket: self.colorBasket)
        
        mixerView.backgroundColor = newColor
        
        let colorName = colorHelper.nameFor(color:newColor)
        
        if (colorName != lastColorName)
        {
            lastColorName = colorName
            
        }
        
        //self.colorNameLabel.text = colorName
        self.colorNameLabel.isHidden = false
        self.colorNameLabel.alpha = 0.0
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.colorNameLabel.alpha = 1.0
            }) { (result) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.colorNameLabel.alpha = 0.0
                    self.colorNameLabel.isHidden = true
                })
        }        

    }
    
    
    @IBAction func touchMixer(sender: UITapGestureRecognizer) {
        //mixerView.backgroundColor = colorHelper.calculateMixedColor(colorBasket: self.colorBasket)
        if (!speechSynthesizer.isSpeaking)
        {
            let speechUtterance = AVSpeechUtterance(string: lastColorName)
            
            speechSynthesizer.speak(speechUtterance)
        }

    }
    @IBAction func longPresshMixer(sender: UILongPressGestureRecognizer) {
        explode()
    }
    
    func explode()
    {
        explosionSound?.play()
        
        colorBasket.removeAll(keepingCapacity: false)
        
        animator.removeBehavior(collision)
        for colorView in mixerView.subviews {
            let push = UIPushBehavior(items: [colorView], mode: .instantaneous)
            push.angle = CGFloat(-1.35) * CGFloat(arc4random())// arc4random_uniform(
            push.magnitude = 1.50
            animator?.addBehavior(push)
            
            //colorView.removeFromSuperview()
            
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                colorView.removeFromSuperview()
            }
        }
        for behavior in basketBehaviors{
            animator.removeBehavior(behavior)
        }
        
        basketBehaviors.removeAll(keepingCapacity: false)
        
        mixerView.backgroundColor = UIColor.clear
        
        hasCollision = false;

        lastColorName = "clear"
    }

    @IBAction func touchEmpty(_ sender: AnyObject) {
        explode()
    }
}
