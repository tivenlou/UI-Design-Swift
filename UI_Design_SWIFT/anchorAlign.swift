//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorAlign: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "anchorAlign"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    
    let contenter = UIView()
    let baseView = UIView()
    let AboveMatchingLeft = UIView()
    let AboveCentered = UIView()
    let AboveMatchingRight = UIView()
    let ToTheRightMatchingTop = UIView()
    let ToTheRightCentered = UIView()
    let ToTheRightMatchingBottom = UIView()
    let UnderMatchingRight = UIView()
    let UnderCentered = UIView()
    let UnderMatchingLeft = UIView()
    let ToTheLeftMatchingBottom = UIView()
    let ToTheLeftCentered = UIView()
    let ToTheLeftMatchingTop = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        baseView.backgroundColor = UIColor.orangeColor()
        baseView.anchorInCenter(contenter, width: 170, height: 170 , autoscall: false)
        
        //AboveMatchingLeft
        AboveMatchingLeft.backgroundColor = UIColor.blueColor()
        AboveMatchingLeft.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.AboveMatchingLeft, gap: 10, width: 50, height: 50, autoscall: false)
        
        //AboveCentered
        AboveCentered.backgroundColor = UIColor.greenColor()
        AboveCentered.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.AboveCentered, gap: 10, width: 50, height: 50, autoscall: false)
        
        //AboveMatchingRight
        AboveMatchingRight.backgroundColor = UIColor.redColor()
        AboveMatchingRight.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.AboveMatchingRight, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheRightMatchingTop
        ToTheRightMatchingTop.backgroundColor = UIColor.blueColor()
        ToTheRightMatchingTop.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheRightMatchingTop, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheRightCentered
        ToTheRightCentered.backgroundColor = UIColor.greenColor()
        ToTheRightCentered.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheRightCentered, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheRightMatchingBottom
        ToTheRightMatchingBottom.backgroundColor = UIColor.redColor()
        ToTheRightMatchingBottom.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheRightMatchingBottom, gap: 10, width: 50, height: 50, autoscall: false)
        
        //UnderMatchingRight
        UnderMatchingRight.backgroundColor = UIColor.redColor()
        UnderMatchingRight.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.UnderMatchingRight, gap: 10, width: 50, height: 50, autoscall: false)
        
        //UnderCentered
        UnderCentered.backgroundColor = UIColor.greenColor()
        UnderCentered.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.UnderCentered, gap: 10, width: 50, height: 50, autoscall: false)
        
        //UnderMatchingLeft
        UnderMatchingLeft.backgroundColor = UIColor.blueColor()
        UnderMatchingLeft.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.UnderMatchingLeft, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheLeftMatchingBottom
        ToTheLeftMatchingBottom.backgroundColor = UIColor.redColor()
        ToTheLeftMatchingBottom.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheLeftMatchingBottom, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheLeftCentered
        ToTheLeftCentered.backgroundColor = UIColor.greenColor()
        ToTheLeftCentered.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheLeftCentered, gap: 10, width: 50, height: 50, autoscall: false)
        
        //ToTheLeftMatchingTop
        ToTheLeftMatchingTop.backgroundColor = UIColor.blueColor()
        ToTheLeftMatchingTop.anchorAlign(contenter, relativeTo: baseView, edgeType: anchorType.ToTheLeftMatchingTop, gap: 10, width: 50, height: 50, autoscall: false)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }

    
    
}

