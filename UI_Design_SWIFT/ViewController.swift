//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonHeight:CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.translucent = false
        
        title = "Menu"
        view.backgroundColor = UIColor.whiteColor()
        
        let contenter = UIView()
        contenter.anchorInCenterFill(view, gap: 0)
        contenter.backgroundColor = UIColor.whiteColor()
        
        let but01 = UIButton()
        but01.anchorEdge(contenter, edgeType: anchorType.Top, gap: 64, width: 0, height: buttonHeight)
        but01.setTitle("anchorInCenter", forState: UIControlState.Normal)
        but01.addTarget(self, action: "anchorInCenter_action", forControlEvents: UIControlEvents.TouchUpInside)
        but01.backgroundColor = UIColor.orangeColor()
        
        let but02 = UIButton()
        but02.anchorAlign(contenter, relativeTo: but01, edgeType: anchorType.UnderCentered, gap: 10, width: 0, height: buttonHeight)
        but02.setTitle("anchorAlign", forState: UIControlState.Normal)
        but02.addTarget(self, action: "anchorAlign_action", forControlEvents: UIControlEvents.TouchUpInside)
        but02.backgroundColor = UIColor.orangeColor()
        
        let but03 = UIButton()
        but03.anchorAlign(contenter, relativeTo: but02, edgeType: anchorType.UnderCentered, gap: 10, width: 0, height: buttonHeight)
        but03.setTitle("anchorInCorner", forState: UIControlState.Normal)
        but03.addTarget(self, action: "anchorInCorner_action", forControlEvents: UIControlEvents.TouchUpInside)
        but03.backgroundColor = UIColor.orangeColor()
        
        let but04 = UIButton()
        but04.anchorAlign(contenter, relativeTo: but03, edgeType: anchorType.UnderCentered, gap: 10, width: 0, height: buttonHeight)
        but04.setTitle("anchorEdge", forState: UIControlState.Normal)
        but04.addTarget(self, action: "anchorEdge_action", forControlEvents: UIControlEvents.TouchUpInside)
        but04.backgroundColor = UIColor.orangeColor()
        
        
    }
    
    
    func anchorEdge_action() {
        self.navigationController?.pushViewController(anchorEdge(), animated: true)
        
    }
    
    func anchorInCorner_action() {
        self.navigationController?.pushViewController(anchorInCorner(), animated: true)
        
    }
    
    func anchorInCenter_action() {
        self.navigationController?.pushViewController(anchorInCenter(), animated: true)
        
    }
    
    func anchorAlign_action() {
        self.navigationController?.pushViewController(anchorAlign(), animated: true)

    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

