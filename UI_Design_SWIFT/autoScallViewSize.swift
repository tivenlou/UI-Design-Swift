//
//  autoScallViewSize.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class autoScallViewSize {
    
    
    class func base_on_iPhone4(originView:UIView, width_resize_only: Bool? = nil, height_resize_only: Bool? = nil) {
        
        let uiscreen_width_now = UIScreen.mainScreen().bounds.width
        let uiscreen_height_now = UIScreen.mainScreen().bounds.height

        var new_width_now = originView.frame.width*(uiscreen_width_now/640/2)
        var new_height_now = originView.frame.height*(uiscreen_height_now/960/2)
        
        if width_resize_only == true {new_height_now = originView.frame.height}
        if height_resize_only == true {new_width_now = originView.frame.width}
        
        //autoscall view size
        originView.frame.size = CGSize(width: new_width_now , height: new_height_now )
        
    }
    
    class func base_on_iPhone5(originView:UIView, width_resize_only: Bool? = nil, height_resize_only: Bool? = nil) {
    
        let uiscreen_width_now = UIScreen.mainScreen().bounds.width
        let uiscreen_height_now = UIScreen.mainScreen().bounds.height

        var new_width_now = originView.frame.width*(uiscreen_width_now/640/2)
        var new_height_now = originView.frame.height*(uiscreen_height_now/1136/2)
        
        if width_resize_only == true {new_height_now = originView.frame.height}
        if height_resize_only == true {new_width_now = originView.frame.width}

        //autoscall view size
        originView.frame.size = CGSize(width: new_width_now , height: new_height_now )
        
    }
    
    class func base_on_iPhone6(originView:UIView, width_resize_only: Bool? = nil, height_resize_only: Bool? = nil) {
        
        let uiscreen_width_now = UIScreen.mainScreen().bounds.width
        let uiscreen_height_now = UIScreen.mainScreen().bounds.height
        
        var new_width_now = originView.frame.width*(uiscreen_width_now/750/2)
        var new_height_now = originView.frame.height*(uiscreen_height_now/1334/2)
        
        if width_resize_only == true {new_height_now = originView.frame.height}
        if height_resize_only == true {new_width_now = originView.frame.width}
        
        //autoscall view size
        originView.frame.size = CGSize(width: new_width_now , height: new_height_now )
        
    }
    
    class func base_on_iPhone6Plus(originView:UIView, width_resize_only: Bool? = nil, height_resize_only: Bool? = nil) {
        
        let uiscreen_width_now = UIScreen.mainScreen().bounds.width
        let uiscreen_height_now = UIScreen.mainScreen().bounds.height
        
        var new_width_now = originView.frame.width*(uiscreen_width_now/1080/2)
        var new_height_now = originView.frame.height*(uiscreen_height_now/1920/2)
        
        if width_resize_only == true {new_height_now = originView.frame.height}
        if height_resize_only == true {new_width_now = originView.frame.width}
        
        //autoscall view size
        originView.frame.size = CGSize(width: new_width_now , height: new_height_now )
        
    }
    
    
}



