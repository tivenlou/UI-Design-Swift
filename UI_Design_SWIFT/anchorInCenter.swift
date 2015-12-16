//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class anchorInCenter: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "anchorInCenter"
        view.backgroundColor = UIColor.lightGrayColor()
        
        
    }
    
    let contenter = UIView()
    let baseView = UIView()
    let view01 = UIView()
    let view02 = UITextField()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        baseView.backgroundColor = UIColor.orangeColor()
        baseView.anchorInCenter(contenter, width: 150, height: 150 , autoscall: false)
        view01.backgroundColor = UIColor.redColor()
        view01.anchorInCenterFill(baseView, gap: 5)
        
        view02.backgroundColor = UIColor.whiteColor()
        view02.anchorInCenter(baseView, width: baseView.frame.width-20, height: 30 , autoscall: false)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }


}

