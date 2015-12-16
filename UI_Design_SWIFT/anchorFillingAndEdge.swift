//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorFillingAndEdge: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        title = "anchorFillingAndEdge"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    let contenter = UIView()
    let Top = UIView()
    let Bottom = UIView()
    let Left = UIView()
    let Right = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        //Top
        Top.backgroundColor = UIColor.orangeColor()
        Top.alpha = 0.3
        Top.anchorFillingAndEdge(contenter, edgeType: anchorType.Top, gap_x: 10, gap_y: 10, othersize: 50, autoscall: false)
        
        //Bottom
        Bottom.backgroundColor = UIColor.redColor()
        Bottom.alpha = 0.3
        Bottom.anchorFillingAndEdge(contenter, edgeType: anchorType.Bottom, gap_x: 10, gap_y: 10, othersize: 50, autoscall: false)
        
        //Left
        Left.backgroundColor = UIColor.blueColor()
        Left.alpha = 0.3
        Left.anchorFillingAndEdge(contenter, edgeType: anchorType.Left, gap_x: 10, gap_y: 10, othersize: 50, autoscall: false)
        
        //Right
        Right.backgroundColor = UIColor.greenColor()
        Right.alpha = 0.3
        Right.anchorFillingAndEdge(contenter, edgeType: anchorType.Right, gap_x: 10, gap_y: 10, othersize: 50, autoscall: false)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }
 
    
}

