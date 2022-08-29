//
//  CGPointExtension.swift
//  FitnessVision
//
//  Created by Devangi Prajapati on 24/08/22.
//

import Foundation
import UIKit

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}
