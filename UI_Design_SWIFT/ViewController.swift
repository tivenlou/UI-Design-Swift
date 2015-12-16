//
//  ViewController.swift
//  UI_Design_SWIFT
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.translucent = false
        
        title = "Menu"
        view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    let contenter = UIView()
    let lab01 = UIButton()
    let lab02 = UIButton()
    let lab03 = UIButton()
    let lab04 = UIButton()
    let lab05 = UIButton()
    let lab06 = UIButton()
    let lab06_1 = UIButton()
    let lab07 = UIButton()
    let lab08 = UIButton()
    let lab09 = UIButton()
    let lab10 = UIButton()
    let lab11 = UIButton()
    
    func reload() {
        
        contenter.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-0)
        contenter.backgroundColor = UIColor.whiteColor()
            view.addSubview(contenter)
            
        
        lab01.setTitle("anchorInCenter", forState: UIControlState.Normal)
        lab01.backgroundColor = UIColor.orangeColor()
        lab01.addTarget(self, action: "anchorInCenter_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab02.setTitle("anchorAlign", forState: UIControlState.Normal)
        lab02.backgroundColor = UIColor.orangeColor()
        lab02.addTarget(self, action: "anchorAlign_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab03.setTitle("anchorInCorner", forState: UIControlState.Normal)
        lab03.backgroundColor = UIColor.orangeColor()
        lab03.addTarget(self, action: "anchorInCorner_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab04.setTitle("anchorEdge", forState: UIControlState.Normal)
        lab04.backgroundColor = UIColor.orangeColor()
        lab04.addTarget(self, action: "anchorEdge_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab05.setTitle("anchorFillingAndEdge", forState: UIControlState.Normal)
        lab05.backgroundColor = UIColor.orangeColor()
        lab05.addTarget(self, action: "anchorFillingAndEdge_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab06.setTitle("anchorFillingAndAlign", forState: UIControlState.Normal)
        lab06.backgroundColor = UIColor.orangeColor()
        lab06.addTarget(self, action: "anchorFillingAndAlign_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab06_1.setTitle("anchorFillingFullAndAlign", forState: UIControlState.Normal)
        lab06_1.backgroundColor = UIColor.orangeColor()
        lab06_1.addTarget(self, action: "anchorFillingFullAndAlign_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab07.setTitle("anchorAlignBetween", forState: UIControlState.Normal)
        lab07.backgroundColor = UIColor.orangeColor()
        lab07.addTarget(self, action: "anchorAlignBetween_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab08.setTitle("groupInCenter", forState: UIControlState.Normal)
        lab08.backgroundColor = UIColor.orangeColor()
        lab08.addTarget(self, action: "groupInCenter_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab09.setTitle("groupInCorner", forState: UIControlState.Normal)
        lab09.backgroundColor = UIColor.orangeColor()
        lab09.addTarget(self, action: "groupInCorner_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        lab10.setTitle("groupAgainstEdge", forState: UIControlState.Normal)
        lab10.backgroundColor = UIColor.orangeColor()
        lab10.addTarget(self, action: "groupAgainstEdge_action", forControlEvents: UIControlEvents.TouchUpInside)
        //anchorGroupAndFill
        lab11.setTitle("anchorGroupAndFill", forState: UIControlState.Normal)
        lab11.backgroundColor = UIColor.orangeColor()
        lab11.addTarget(self, action: "anchorGroupAndFill_action", forControlEvents: UIControlEvents.TouchUpInside)
        
        let array_views = [lab01,lab02,lab03,lab04,lab05,lab06,lab06_1,lab07,lab08,lab09,lab10,lab11] as NSArray
        contenter.anchorGrouping(array_views,
            groupin: groupInType.groupAgainstEdge_Top,
            orientation: orientationType.Vertical,
            gap: 10 , width: 300 , height: 20,
            autoscall: true , sizeToFit: true )
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        reload()
    }
    
    func anchorGroupAndFill_action() {
        self.navigationController?.pushViewController(anchorGroupAndFill(), animated: true)
        
    }
    
    func anchorFillingFullAndAlign_action () {
        self.navigationController?.pushViewController(anchorFillingFullAndAlign(), animated: true)
        
    }
    
    func groupAgainstEdge_action() {
        self.navigationController?.pushViewController(groupAgainstEdge(), animated: true)
        
    }
    
    func groupInCorner_action() {
        self.navigationController?.pushViewController(groupInCorner(), animated: true)
        
    }
    
    func groupInCenter_action() {
        self.navigationController?.pushViewController(groupInCenter(), animated: true)
        
    }
    
    func anchorAlignBetween_action() {
        self.navigationController?.pushViewController(anchorAlignBetween(), animated: true)
        
    }
    
    func anchorFillingAndAlign_action() {
        self.navigationController?.pushViewController(anchorFillingAndAlign(), animated: true)
    }
    
    func anchorFillingAndEdge_action() {
        self.navigationController?.pushViewController(anchorFillingAndEdge(), animated: true)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

