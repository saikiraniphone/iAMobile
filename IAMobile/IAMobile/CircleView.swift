//
//  CircleView.swift
//  IAMobile
//
//  Created by sai on 26/02/17.
//  Copyright © 2017 Sai. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

	
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		self.layer.cornerRadius = self.frame.size.width/2;
		self.layer.masksToBounds = true
    }
	

}
