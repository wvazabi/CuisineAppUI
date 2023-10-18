//
//  imagesize.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 18.10.2023.
//

import Foundation
import UIKit

class OvalImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()

        // Resminizin yanlarını oval yapmak için bir mask oluşturun
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
