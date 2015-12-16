//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class groupInCenter: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        title = "groupInCenter"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    
    let contenter = UIView()
    let view01 = UIView()
    let view02 = UIView()
    let view03 = UIView()
    let view04 = UIView()
    let view11 = UIView()
    let view22 = UIView()
    let view33 = UIView()
    let view44 = UIView()
    
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        view01.alpha = 0.3
        view01.backgroundColor = UIColor.orangeColor()
        view02.alpha = 0.3
        view02.backgroundColor = UIColor.redColor()
        view03.alpha = 0.3
        view03.backgroundColor = UIColor.greenColor()
        view04.alpha = 0.3
        view04.backgroundColor = UIColor.blueColor()
        let arrayViews = [view01,view02,view03,view04] as NSArray
        contenter.anchorGrouping( arrayViews, groupin: groupInType.groupInCenter, orientation: orientationType.Horizontal, gap: 10, width: 50, height: 50, autoscall: false, sizeToFit: true )
        
        view11.alpha = 0.3
        view11.backgroundColor = UIColor.orangeColor()
        view22.alpha = 0.3
        view22.backgroundColor = UIColor.redColor()
        view33.alpha = 0.3
        view33.backgroundColor = UIColor.greenColor()
        view44.alpha = 0.3
        view44.backgroundColor = UIColor.blueColor()
        let arrayViews_B = [view11,view22,view33,view44] as NSArray
        contenter.anchorGrouping( arrayViews_B , groupin: groupInType.groupInCenter, orientation: orientationType.Vertical, gap: 10, width: 50, height: 50, autoscall: false, sizeToFit: true )
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }
  
    
}

