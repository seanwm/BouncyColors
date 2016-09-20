//
//  MixerView.swift
//  ColorMixer
//
//  Created by Sean Mahan on 9/18/16.
//  Copyright © 2016 Intended Effect. All rights reserved.
//

import Foundation
import UIKit

class MixerView : UIView {
    
    /*var myBezierPath : UIBezierPath!
    
    override func awakeFromNib() {
        myBezierPath = UIBezierPath(arcCenter: CGPoint(x:self.bounds.width/2.0, y:self.bounds.height/2.0), radius: (self.frame.width / 2.0) - 4.0, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)

    }*/
    
    /*override func draw(_ rect: CGRect) {
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: 0))
        myBezier.addLine(to: CGPoint(x: 100, y: 0))
        myBezier.addLine(to: CGPoint(x: 50, y: 100))
        myBezier.close()
        UIColor.black.setStroke()
        myBezier.stroke()

        myBezierPath = UIBezierPath(arcCenter: CGPoint(x:self.bounds.width/2.0, y:self.bounds.height/2.0), radius: 120, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)

        UIColor.red.setStroke()
        UIColor.blue.setFill()
        myBezierPath.stroke()
    }*/
    /*
    func getCollisionBoundingPath()->UIBezierPath
    {
        return myBezierPath;
    }*/
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType
        {
        get{
            return UIDynamicItemCollisionBoundsType.ellipse;
        }
    }

/*    func getCollisionBoundsType()->UIDynamicItemCollisionBoundsType
    {
        return UIDynamicItemCollisionBoundsType.path;
    }*/
    }
