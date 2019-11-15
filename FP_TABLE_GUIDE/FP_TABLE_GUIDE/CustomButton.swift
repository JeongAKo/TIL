//
//  CustomButton.swift
//  FP_TABLE_GUIDE
//
//  Created by 이신우 on 2019/11/15.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    let myLabel:CustomLabel = CustomLabel()
    
    
    

   
    func setMyButton() {
       
        myLabel.frame = self.bounds
//        myLabel.myStyle()
        
        self.addSubview(myLabel)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
