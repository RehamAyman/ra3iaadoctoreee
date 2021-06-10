//
//  LayerExtention.swift
//  SeaTrips
//
//  Created by Sara Mady on 22/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))

    let shape = CAShapeLayer()
    shape.path = maskPath.cgPath
    mask = shape
  }
}
