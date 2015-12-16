//
//  autoScallViewSize.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class autoScallViewSize {
    
    class func base_on_iPhone5(originView:UIView, width_resize_only: Bool? = nil, height_resize_only: Bool? = nil) {
    
        let uiscreen_width_now = UIScreen.mainScreen().bounds.width
        let uiscreen_height_now = UIScreen.mainScreen().bounds.height
        
        var new_width_now = CGFloat(0)
        var new_height_now = CGFloat(0)
        
        new_width_now = originView.frame.width*(uiscreen_width_now/320)
        new_height_now = originView.frame.height*(uiscreen_height_now/568)
        
        if width_resize_only == true {new_height_now = originView.frame.height}
        if height_resize_only == true {new_width_now = originView.frame.width}

        //autoscall view size
        originView.frame.size = CGSize(width: new_width_now , height: new_height_now )
        
    }
    
    
}



