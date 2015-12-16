//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorAlignBetween: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        title = "anchorAlignBetween"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    
    let contenter = UIView()
    let TopLeft = UIView()
    let TopRight = UIView()
    let BottomLeft = UIView()
    let BottomRight = UIView()
    let AlignBetweenHorizontal = UIView()
    let AlignBetweenHorizontal_ToTheRightCentered = UIView()
    let AlignBetweenHorizontal_ToTheRightMatchingBottom = UIView()
    let AlignBetweenHorizontal_ToTheLeftMatchingBottom = UIView()
    let AlignBetweenHorizontal_ToTheLeftCentered = UIView()
    let AlignBetweenHorizontal_ToTheLeftMatchingTop = UIView()
    let AlignBetweenVertical_UnderMatchingLeft = UIView()
    let AlignBetweenVertical_UnderCentered = UIView()
    let AlignBetweenVertical_UnderMatchingRight = UIView()
    let AlignBetweenVertical_AboveMatchingLeft = UIView()
    let AlignBetweenVertical_AboveCentered = UIView()
    let AlignBetweenVertical_AboveMatchingRight = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        //TopLeft
        TopLeft.backgroundColor = UIColor.orangeColor()
        TopLeft.anchorInCorner(contenter, edgeType: anchorType.TopLeft, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //TopRight
        TopRight.backgroundColor = UIColor.blueColor()
        TopRight.anchorInCorner(contenter, edgeType: anchorType.TopRight, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //BottomLeft
        BottomLeft.backgroundColor = UIColor.redColor()
        BottomLeft.anchorInCorner(contenter, edgeType: anchorType.BottomLeft, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //BottomRight
        BottomRight.backgroundColor = UIColor.greenColor()
        BottomRight.anchorInCorner(contenter, edgeType: anchorType.BottomRight, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //Between TopLeft and TopRight and align ToTheRightMatchingTop
        AlignBetweenHorizontal.backgroundColor = UIColor.lightGrayColor()
        AlignBetweenHorizontal.anchorAlignBetween(
            contenter,
            primaryView: TopLeft,
            secondaryView: TopRight,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype:anchorType.ToTheRightMatchingTop,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopLeft and TopRight and align ToTheRightCentered
        AlignBetweenHorizontal_ToTheRightCentered.backgroundColor = UIColor.lightGrayColor()
        AlignBetweenHorizontal_ToTheRightCentered.anchorAlignBetween(
            contenter,
            primaryView: TopLeft,
            secondaryView: TopRight,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype:anchorType.ToTheRightCentered,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopLeft and TopRight and align ToTheRightMatchingBottom
        AlignBetweenHorizontal_ToTheRightMatchingBottom.backgroundColor = UIColor.lightGrayColor()
        AlignBetweenHorizontal_ToTheRightMatchingBottom.anchorAlignBetween(
            contenter,
            primaryView: TopLeft,
            secondaryView: TopRight,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype:anchorType.ToTheRightMatchingBottom,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between BottomLeft and BottomRight and align ToTheLeftMatchingBottom
        AlignBetweenHorizontal_ToTheLeftMatchingBottom.backgroundColor = UIColor.blackColor()
        AlignBetweenHorizontal_ToTheLeftMatchingBottom.anchorAlignBetween(
            contenter,
            primaryView: BottomRight,
            secondaryView: BottomLeft,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype: anchorType.ToTheLeftMatchingBottom,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between BottomLeft and BottomRight and align ToTheLeftCentered
        AlignBetweenHorizontal_ToTheLeftCentered.backgroundColor = UIColor.blackColor()
        AlignBetweenHorizontal_ToTheLeftCentered.anchorAlignBetween(
            contenter,
            primaryView: BottomRight,
            secondaryView: BottomLeft,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype: anchorType.ToTheLeftCentered,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between BottomLeft and BottomRight and align ToTheLeftMatchingTop
        AlignBetweenHorizontal_ToTheLeftMatchingTop.backgroundColor = UIColor.blackColor()
        AlignBetweenHorizontal_ToTheLeftMatchingTop.anchorAlignBetween(
            contenter,
            primaryView: BottomRight,
            secondaryView: BottomLeft,
            edgeType: anchorType.AlignBetweenHorizontal,
            aligntype: anchorType.ToTheLeftMatchingTop,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopRight and BottomRight and align UnderMatchingLeft
        AlignBetweenVertical_UnderMatchingLeft.backgroundColor = UIColor.yellowColor()
        AlignBetweenVertical_UnderMatchingLeft.anchorAlignBetween(
            contenter,
            primaryView: TopRight,
            secondaryView: BottomRight,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.UnderMatchingLeft,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopRight and BottomRight and align UnderCentered
        AlignBetweenVertical_UnderCentered.backgroundColor = UIColor.yellowColor()
        AlignBetweenVertical_UnderCentered.anchorAlignBetween(
            contenter,
            primaryView: TopRight,
            secondaryView: BottomRight,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.UnderCentered,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopRight and BottomRight and align UnderMatchingRight
        AlignBetweenVertical_UnderMatchingRight.backgroundColor = UIColor.yellowColor()
        AlignBetweenVertical_UnderMatchingRight.anchorAlignBetween(
            contenter,
            primaryView: TopRight,
            secondaryView: BottomRight,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.UnderMatchingRight,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopLeft and BottomLeft and align AboveMatchingLeft
        AlignBetweenVertical_AboveMatchingLeft.backgroundColor = UIColor.brownColor()
        AlignBetweenVertical_AboveMatchingLeft.anchorAlignBetween(
            contenter,
            primaryView: BottomLeft ,
            secondaryView: TopLeft ,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.AboveMatchingLeft,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopLeft and BottomLeft and align AboveCentered
        AlignBetweenVertical_AboveCentered.backgroundColor = UIColor.brownColor()
        AlignBetweenVertical_AboveCentered.anchorAlignBetween(
            contenter,
            primaryView: BottomLeft ,
            secondaryView: TopLeft ,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.AboveCentered,
            gap: 10, othersize: 20, autoscall: false)
        
        //Between TopLeft and BottomLeft and align AboveMatchingRight
        AlignBetweenVertical_AboveMatchingRight.backgroundColor = UIColor.brownColor()
        AlignBetweenVertical_AboveMatchingRight.anchorAlignBetween(
            contenter,
            primaryView: BottomLeft ,
            secondaryView: TopLeft ,
            edgeType: anchorType.AlignBetweenVertical,
            aligntype: anchorType.AboveMatchingRight,
            gap: 10, othersize: 20, autoscall: false)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }
    
    
}

