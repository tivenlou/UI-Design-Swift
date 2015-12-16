//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorEdge: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        title = "anchorEdge"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    let contenter = UIView()
    let Top = UIView()
    let Left = UIView()
    let Bottom = UIView()
    let Right = UIView()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        //Top
        Top.backgroundColor = UIColor.orangeColor()
        Top.anchorEdge(contenter, edgeType: anchorType.Top, gap: 10, width: 100, height: 100)
        
        //Left
        Left.backgroundColor = UIColor.blueColor()
        Left.anchorEdge(contenter, edgeType: anchorType.Left, gap: 10, width: 100, height: 100)
        
        //Bottom
        Bottom.backgroundColor = UIColor.greenColor()
        Bottom.anchorEdge(contenter, edgeType: anchorType.Bottom, gap: 10, width: 100, height: 100)
        
        //Right
        Right.backgroundColor = UIColor.redColor()
        Right.anchorEdge(contenter, edgeType: anchorType.Right, gap: 10, width: 100, height: 100)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }

    
    
}

