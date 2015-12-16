//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorFillingAndAlign: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        title = "anchorFillingAndAlign"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    let contenter = UIView()
    let baseView03 = UIView()
    let view03 = UIView()
    let view04 = UIView()
    let view05 = UIView()
    let view06 = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
    
        //Center
        baseView03.backgroundColor = UIColor.blueColor()
        baseView03.anchorInCenter(contenter, width: 60, height: 60)
        
        view03.backgroundColor = UIColor.lightGrayColor()
        view03.alpha = 0.5
        view03.anchorAlignAndFillWidth(contenter, relativeTo: baseView03, edgeType: anchorType.ToTheLeftMatchingBottom, gap: 10, height: 30, autoscall: false)
        
        view04.backgroundColor = UIColor.lightGrayColor()
        view04.alpha = 0.5
        view04.anchorAlignAndFillWidth(contenter, relativeTo: baseView03, edgeType: anchorType.ToTheRightMatchingTop, gap: 10, height: 30, autoscall: false)
        
        view05.backgroundColor = UIColor.lightGrayColor()
        view05.alpha = 0.5
        view05.anchorAlignAndFillHeight(contenter, relativeTo: baseView03, edgeType: anchorType.AboveMatchingLeft, gap: 10, width: 30, autoscall: false)
        
        view06.backgroundColor = UIColor.lightGrayColor()
        view06.alpha = 0.5
        view06.anchorAlignAndFillHeight(contenter, relativeTo: baseView03, edgeType: anchorType.UnderMatchingRight, gap: 10, width: 30, autoscall: false)
                
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }

    
    
}

