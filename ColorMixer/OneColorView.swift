//
//  OneColorView.swift
//  ColorMixer
//
//  Created by Sean Mahan on 9/18/16.
//  Copyright © 2016 Intended Effect. All rights reserved.
//

import Foundation
import UIKit

class OneColorView : UIView {
    var myBezierPath : UIBezierPath!

    /*override var collisionBoundingPath: UIBezierPath
    {
        get{
            if (myBezierPath == nil)
            {
                myBezierPath = UIBezierPath(arcCenter: CGPoint(x:self.bounds.width/2.0, y:self.bounds.height/2.0), radius: (self.frame.width / 2.0) - 1.0, startAngle: 0, endAngle: CGFloat(2.0) * CGFloat.pi, clockwise: true)
            }
            return myBezierPath;
        }
    }*/
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType
    {
        get{
                return UIDynamicItemCollisionBoundsType.ellipse;
        }
    }

}
