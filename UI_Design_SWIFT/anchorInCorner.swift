//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorInCorner: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "anchorCorner"
        view.backgroundColor = UIColor.lightGrayColor()
        
        
    }
    
    let contenter = UIView()
    let baseView = UIView()
    let TopRight = UIView()
    let BottomLeft = UIView()
    let BottomRight = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        //TopLeft
        baseView.backgroundColor = UIColor.orangeColor()
        baseView.anchorInCorner(contenter, edgeType: anchorType.TopLeft, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //TopRight
        TopRight.backgroundColor = UIColor.blueColor()
        TopRight.anchorInCorner(contenter, edgeType: anchorType.TopRight, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //BottomLeft
        BottomLeft.backgroundColor = UIColor.redColor()
        BottomLeft.anchorInCorner(contenter, edgeType: anchorType.BottomLeft, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
        //BottomRight
        BottomRight.backgroundColor = UIColor.greenColor()
        BottomRight.anchorInCorner(contenter, edgeType: anchorType.BottomRight, gap_x: 20, gap_y: 20, width: 100, height: 100)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }


    
    
}

