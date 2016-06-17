//
//  ancroInCenter.swift
//  UI_Design_SWIFT V1.1.0
//
//  Created by 陸泰文 on 2015/12/8.
//  Copyright © 2015年 陸泰文. All rights reserved.
//

import UIKit

enum anchorType: Int {
    case
    Top = 0,
    Left,
    Bottom,
    Right,
    AboveMatchingLeft,
    AboveCentered,
    AboveMatchingRight,
    ToTheRightMatchingTop,
    ToTheRightCentered,
    ToTheRightMatchingBottom,
    UnderMatchingRight,
    UnderMatchingLeft,
    ToTheLeftMatchingBottom,
    ToTheLeftCentered,
    ToTheLeftMatchingTop,
    UnderCentered,
    TopLeft,
    TopRight,
    BottomLeft,
    BottomRight,
    AlignBetweenHorizontal,
    AlignBetweenVertical
}

enum groupInType: Int {
    case
    groupInCenter,
    groupInCorner_TopLeft,
    groupInCorner_TopRight,
    groupInCorner_BottomLeft,
    groupInCorner_BottomRight,
    groupAgainstEdge_Top,
    groupAgainstEdge_Left,
    groupAgainstEdge_Bottom,
    groupAgainstEdge_Right,
    groupAndFill
    
    
}

enum orientationType: Int {
    case
    Horizontal,
    Vertical
}

extension UIView {
    //MARK: - ancroInCenter
    func anchorInCenter(originView:UIView,  width:CGFloat,  height:CGFloat ) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        originView.addSubview(self)
        self.ConstraintCenterY(originView)
        self.ConstraintCenterX(originView)
        self.ConstraintSetWidth(originView, width: width)
        self.ConstraintSetHeight(originView, height: height)
        
    }
    
    //MARK: - ancroInCenterFill
    func anchorInCenterFill(originView:UIView, gap: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        originView.addSubview(self)
        self.ConstraintCenterY(originView)
        self.ConstraintCenterX(originView)
        self.ConstraintSetWidth(originView, width: originView.frame.width - gap)
        self.ConstraintSetHeight(originView, height: originView.frame.height - gap)
        
    }
    
    //MARK: - anchorEdge
    func anchorEdge(originView:UIView, edgeType: anchorType, gap: CGFloat, width:CGFloat, height:CGFloat) {
        
        switch edgeType {
            
        case .Top :
            self.translatesAutoresizingMaskIntoConstraints = false
            originView.addSubview(self)
            self.ConstraintTop(originView, gap: gap)
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintCenterX(originView)
            
        case .Left :
            self.translatesAutoresizingMaskIntoConstraints = false
            originView.addSubview(self)
            self.ConstraintLeft(originView, gap: gap)
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintCenterY(originView)
            
        case .Bottom :
            
            self.translatesAutoresizingMaskIntoConstraints = false
            originView.addSubview(self)
            self.ConstraintBottom(originView, gap: gap)
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintCenterX(originView)
            
        case .Right :
            
            self.translatesAutoresizingMaskIntoConstraints = false
            originView.addSubview(self)
            self.ConstraintRight(originView, gap: gap)
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintCenterY(originView)
            
        default :
            return
            
        }
        
    }
    
    //MARK: - anchorAlign
    func anchorAlign(originView:UIView, relativeTo: UIView, edgeType: anchorType, gap: CGFloat,  width:CGFloat, height:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        originView.addSubview(self)
        
        switch edgeType {
            
        case .AboveMatchingLeft :
            
            self.ConstraintSetAboveTop(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstriantSetMatchingLeft(originView, relativeTo: relativeTo, gap: 0)
            
        case .AboveCentered :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintRelativeCenterX(originView, relativeTo: relativeTo)
            self.ConstraintSetAboveTop(originView, relativeTo: relativeTo, gap: gap)
            
        case .AboveMatchingRight :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstriantSetMatchingRight(originView, relativeTo: relativeTo, gap: 0)
            self.ConstraintSetAboveTop(originView, relativeTo: relativeTo, gap: gap)
            
        case .ToTheRightMatchingTop :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheRight(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintMatchingTop(originView, relativeTo: relativeTo, gap: 0)
            
            
        case .ToTheRightCentered :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheRight(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintRelativeCenterY(originView, relativeTo: relativeTo)
            
        case .ToTheRightMatchingBottom :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheRight(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintMatchingBottom(originView, relativeTo: relativeTo, gap: 0)
            
        case .UnderMatchingRight :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstriantSetMatchingRight(originView, relativeTo: relativeTo, gap: 0)
            self.ConstraintSetUnder(originView, relativeTo: relativeTo, gap: gap)
            
        case .UnderCentered :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintSetUnder(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintRelativeCenterX(originView, relativeTo: relativeTo)
            
        case .UnderMatchingLeft :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintSetUnder(originView, relativeTo: relativeTo, gap: gap)
            self.ConstriantSetMatchingLeft(originView, relativeTo: relativeTo, gap: 0)
            
        case .ToTheLeftMatchingBottom :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheLeft(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintMatchingBottom(originView, relativeTo: relativeTo, gap: 0)
            
            
        case .ToTheLeftCentered :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheLeft(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintRelativeCenterY(originView, relativeTo: relativeTo)
            
            
        case .ToTheLeftMatchingTop :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintToTheLeft(originView, relativeTo: relativeTo, gap: gap)
            self.ConstraintMatchingTop(originView, relativeTo: relativeTo, gap: 0)
            
        default :
            ////print("error anchorType not exist!")
            return
        }
        
        
        
    }
    
    //MARK: - anchorInCorner
    func anchorInCorner(originView:UIView, edgeType: anchorType, gap_x: CGFloat, gap_y:CGFloat,  width:CGFloat,  height:CGFloat) {
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        originView.addSubview(self)
        
        switch edgeType {
            
        case .TopLeft :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintTop(originView, gap: gap_x)
            self.ConstraintLeft(originView, gap: gap_y)
            
        case .TopRight :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintTop(originView, gap: gap_x)
            self.ConstraintRight(originView, gap: gap_y * -1)
            
        case .BottomLeft :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintBottom(originView, gap: gap_x * -1)
            self.ConstraintLeft(originView, gap: gap_y)
            
            
        case .BottomRight :
            
            self.ConstraintSetWidth(originView, width: width)
            self.ConstraintSetHeight(originView, height: height)
            self.ConstraintBottom(originView, gap: gap_x * -1)
            self.ConstraintRight(originView, gap: gap_y * -1)
            
        default :
            ////print("error anchorType not exist!")
            return
        }
        
    }
    
    //MARK: - Constraints Funcion
    
    func ConstraintLeft(originView: UIView, gap: CGFloat) {
        let ConstraintLeft = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintLeft)
        
    }
    
    func ConstraintBottom(originView: UIView, gap: CGFloat) {
        
        let ConstraintBottom = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintBottom)
        
    }
    
    func ConstraintRight(originView: UIView, gap: CGFloat) {
        
        let ConstraintRight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintRight)
        
    }
    
    func ConstraintCenterY(originView: UIView) {
        let ConstraintCenterY = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        originView.addConstraint(ConstraintCenterY)
    }
    
    func ConstraintCenterX(originView: UIView) {
        let ConstraintCenterX = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        originView.addConstraint(ConstraintCenterX)
    }
    
    func ConstraintTop(originView: UIView, gap: CGFloat) {
        let ConstraintTop = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintTop)
    }
    
    func ConstraintSetWidth(originView: UIView, width: CGFloat) {
        
        if width == 0 {//set width 0 = fullFill with originView width
            let ConstrainWidth = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
            originView.addConstraint(ConstrainWidth)
        }else{
            let ConstrainWidth = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width)
            originView.addConstraint(ConstrainWidth)
        }
        
    }
    
    func ConstraintSetHeight(originView: UIView, height: CGFloat) {
        
        if height == 0 {//set height 0 = fullFill with originView height
            let ConstrainHeight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: originView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0)
            originView.addConstraint(ConstrainHeight)
        }else{
            let ConstrainHeight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
            originView.addConstraint(ConstrainHeight)
        }
    }
    
    func ConstraintSetAboveTop(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        
        let ConstraintSetAboveTop = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: gap * -1)
        originView.addConstraint(ConstraintSetAboveTop)
    }
    
    func ConstriantSetMatchingLeft(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        let ConstraintLeft = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintLeft)
    }
    
    func ConstriantSetMatchingRight(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        let ConstraintRight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintRight)
    }
    
    func ConstraintToTheRight(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        let ConstraintToTheRight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintToTheRight)
    }
    
    func ConstraintToTheLeft(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        let ConstraintToTheLeft = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: gap * -1)
        originView.addConstraint(ConstraintToTheLeft)
    }
    
    func ConstraintMatchingTop(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        
        let ConstraintToTheRight = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintToTheRight)
    }
    
    func ConstraintRelativeCenterX(originView: UIView, relativeTo: UIView) {
        
        let ConstraintRelativeCenterX = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        originView.addConstraint(ConstraintRelativeCenterX)
    }
    
    func ConstraintRelativeCenterY(originView: UIView, relativeTo: UIView) {
        
        let ConstraintRelativeCenterY = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        originView.addConstraint(ConstraintRelativeCenterY)
    }
    
    func ConstraintMatchingBottom(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        
        let ConstraintMatchingBottom = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: gap)
        originView.addConstraint(ConstraintMatchingBottom)
    }
    
    func ConstraintSetUnder(originView: UIView, relativeTo: UIView, gap: CGFloat) {
        
        let ConstraintSetUnder = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: relativeTo, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: gap )
        originView.addConstraint(ConstraintSetUnder)
    }
    //MARK: -
    
}






















