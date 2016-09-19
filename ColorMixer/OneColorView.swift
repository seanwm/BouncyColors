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
    
    func getCollisionBoundsType()->UIDynamicItemCollisionBoundsType
    {
        return UIDynamicItemCollisionBoundsType.ellipse;
    }
}
