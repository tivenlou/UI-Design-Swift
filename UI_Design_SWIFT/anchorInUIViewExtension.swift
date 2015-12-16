//
//  ancroInCenter.swift
//  UI_Design_SWIFT
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
    func anchorInCenter(originView:UIView, var width:CGFloat, var height:CGFloat ,autoscall:Bool? = nil ) {
        //set self view size
        self.frame.size = CGSize(width: width, height: height)
        //autoscall view size base on iPhone 5
        if autoscall == true {
            autoScallViewSize.base_on_iPhone5(self)
            width = self.frame.width
            height = self.frame.height
        }
        
        //set self view location
        let origiView_width = originView.frame.width
        let origiView_height = originView.frame.height
        let center_dx = (origiView_width/2)-(width/2)
        let center_dy = (origiView_height/2)-(height/2)
        
        self.frame = CGRectMake(center_dx, center_dy, width, height)
            originView.addSubview(self)
            
        
    }
    
    
    //MARK: - ancroInCenterFill
    func anchorInCenterFill(originView:UIView, gap: CGFloat) {
        
        let originView_width = originView.frame.width
        let originView_height = originView.frame.height
        
        //set self view location
        let center_dx = gap
        let center_dy = gap
        self.frame = CGRectMake(center_dx, center_dy, originView_width-gap*2, originView_height-gap*2)
            originView.addSubview(self)
            
        
    }
    
    //MARK: - anchorEdge
    func anchorEdge(originView:UIView, edgeType: anchorType, gap: CGFloat, var width:CGFloat, var height:CGFloat, autoscall:Bool? = nil) {
        
        switch edgeType {
            
        case .Top :
            print("anchorEdge Top")
            //set self view size
            self.frame.size = CGSize(width: width, height: height)
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self)
                width = self.frame.width
                height = self.frame.height
            }
            
            //set self view location
            let origiView_width = originView.frame.width
            let center_dx = origiView_width/2-width/2
            let center_dy = gap
            self.frame = CGRectMake(center_dx, center_dy, width, height)
                originView.addSubview(self)
                
            
        case .Left :
            print("anchorEdge Left")
            //set self view size
            self.frame.size = CGSize(width: width, height: height)
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self)
                width = self.frame.width
                height = self.frame.height
            }
            //set self view location
            let origiView_height = originView.frame.height
            let center_dy = origiView_height/2-height/2
            self.frame = CGRectMake(gap, center_dy, width, height)
                originView.addSubview(self)
                
            
        case .Bottom :
            print("anchorEdge Bottom")
            //set self view size
            self.frame.size = CGSize(width: width, height: height)
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self)
                width = self.frame.width
                height = self.frame.height
            }
            //set self view location
            let origiView_width = originView.frame.width
            let origiView_height = originView.frame.height
            let center_dx = origiView_width/2-width/2
            self.frame = CGRectMake(center_dx, origiView_height-gap-height, width, height)
                originView.addSubview(self)
                
        case .Right :
            print("anchorEdge Right")
            //set self view size
            self.frame.size = CGSize(width: width, height: height)
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self)
                width = self.frame.width
                height = self.frame.height
            }
            //set self view location
            let origiView_width = originView.frame.width
            let origiView_height = originView.frame.height
            let center_dy = origiView_height/2-height/2
            self.frame = CGRectMake(origiView_width-gap-width, center_dy, width, height)
                originView.addSubview(self)
                
        default :
            print("error anchorType not exist!")
            return
            
        }
        
        
    }
    
    
    //MARK: - anchorAlignAndFillWidth
    func anchorAlignAndFillWidth(originView:UIView, relativeTo: UIView, edgeType: anchorType, gap: CGFloat, var height:CGFloat, autoscall:Bool? = nil) {
        
        print("anchorAlignAndFillWidth")
        
        var relativeTo_gap = CGFloat(0)
        
        switch edgeType {
            //check left or right
        case
        anchorType.ToTheLeftCentered,
        anchorType.ToTheLeftMatchingTop,
        anchorType.ToTheLeftMatchingBottom :
            print("left side")
            relativeTo_gap = abs(CGRectGetMaxX(originView.frame) - CGRectGetMaxX(relativeTo.frame))
        case
        anchorType.ToTheRightCentered,
        anchorType.ToTheRightMatchingTop,
        anchorType.ToTheRightMatchingBottom :
            print("right side")
            relativeTo_gap = abs(CGRectGetMinX(originView.frame) - CGRectGetMinX(relativeTo.frame))
            
        default:
            print("anchorAlignAndFillWidth edgeType error! only left or right!")
            return
        }
        
        var width = originView.frame.width - relativeTo.frame.width - (gap*2) - relativeTo_gap
        //set self view size
        self.frame.size = CGSize(width: width, height: height)
        //autoscall view size base on iPhone 5
        if autoscall == true {
            autoScallViewSize.base_on_iPhone5(self, width_resize_only: false, height_resize_only: true)
            width = self.frame.width
            height = self.frame.height
        }
        self.anchorAlign(originView, relativeTo: relativeTo, edgeType: edgeType, gap: gap, width: width, height: height)
        
    }
    
    //MARK: - anchorAlignAndFillHeight
    func anchorAlignAndFillHeight(originView:UIView, relativeTo: UIView, edgeType: anchorType, gap: CGFloat, var width :CGFloat, autoscall:Bool? = nil) {
        
        print("anchorAlignAndFillHeight")
        //check above or under
        
        var relativeTo_gap = CGFloat(0)
        
        switch edgeType {
            
            case
            .UnderCentered,
            .UnderMatchingLeft,
            .UnderMatchingRight :
            print("under")
            relativeTo_gap = abs(CGRectGetMinY(originView.frame) - CGRectGetMinY(relativeTo.frame))
            
            case
            .AboveCentered,
            .AboveMatchingLeft,
            .AboveMatchingRight :
            print("above")
            relativeTo_gap = abs(CGRectGetMaxY(originView.frame) - CGRectGetMaxY(relativeTo.frame))
            
            
        default:
            print("anchorAlignAndFillHeight edgeType error! only above or under!")
            return
        }
        
        var height = originView.frame.height - relativeTo.frame.height - (gap*2) - relativeTo_gap
        //set self view size
        self.frame.size = CGSize(width: width, height: height)
        //autoscall view size base on iPhone 5
        if autoscall == true {
            autoScallViewSize.base_on_iPhone5(self, width_resize_only: true, height_resize_only: false)
            width = self.frame.width
            height = self.frame.height
        }
        self.anchorAlign(originView, relativeTo: relativeTo, edgeType: edgeType, gap: gap, width: width, height: height)
        
    }
    
    
    //MARK: - anchorAlignAndFillHeight
    func anchorAlignAndFillFull(originView:UIView, relativeTo: UIView, edgeType: anchorType, gap: CGFloat) {
        
        print("anchorAlignAndFillHeight")
        //check anchorType
//        var relativeTo_gap = CGFloat(0)
        var width = CGFloat(30)//default value
        var height = CGFloat(30)//default value

        switch edgeType {
            
        //above and under
        case
        .AboveCentered,
        .AboveMatchingLeft,
        .AboveMatchingRight,
        .UnderCentered,
        .UnderMatchingLeft,
        .UnderMatchingRight :
        print("above and under")
        
        self.anchorAlignAndFillHeight(originView, relativeTo: relativeTo, edgeType: edgeType, gap: gap, width: width, autoscall: false)
        
            //set width by edgeType
            switch edgeType {
                case .AboveMatchingLeft , .UnderMatchingLeft :
                    width = abs(CGRectGetMinX(relativeTo.frame) - CGRectGetMaxX(originView.frame)) - gap
                case .AboveMatchingRight, .UnderMatchingRight :
                    self.frame = CGRectMake(gap, self.frame.origin.y, width, self.frame.height)
                    width = abs(CGRectGetMaxX(relativeTo.frame) - CGRectGetMinX(originView.frame)) - gap
                case .AboveCentered , .UnderCentered :
                    self.frame = CGRectMake(gap, self.frame.origin.y, width, self.frame.height)
                    width = originView.frame.width - (gap*2)
                default:
                    break
            }
        self.frame.size.width = width

        case
        .ToTheLeftCentered,
        .ToTheLeftMatchingTop,
        .ToTheLeftMatchingBottom,
        .ToTheRightCentered,
        .ToTheRightMatchingTop,
        .ToTheRightMatchingBottom :
            print("left and right")
            self.anchorAlignAndFillWidth(originView, relativeTo: relativeTo, edgeType: edgeType, gap: gap, height: height, autoscall: false)
            
            //set width by edgeType
            switch edgeType {
            case .ToTheLeftMatchingTop , .ToTheRightMatchingTop :
                height = abs(CGRectGetMinY(relativeTo.frame) - CGRectGetMaxY(originView.frame)) - gap
            case .ToTheLeftMatchingBottom , .ToTheRightMatchingBottom :
                height = abs(CGRectGetMaxY(relativeTo.frame) - CGRectGetMinY(originView.frame)) - gap
                self.frame = CGRectMake(self.frame.origin.x , gap , self.frame.width, height)
            case .ToTheLeftCentered , .ToTheRightCentered :
                self.frame = CGRectMake(self.frame.origin.x , gap , self.frame.width, height)
                height = originView.frame.height - (gap*2)
            default:
                break
            }
            
        self.frame.size.height = height
            
            
        default:
            print("error anchorAlignAndFillHeight edgeType not exist!")
        }

    }
    
    //MARK: - anchorAlign
    func anchorAlign(originView:UIView, relativeTo: UIView, edgeType: anchorType, gap: CGFloat, var width:CGFloat, var height:CGFloat, autoscall:Bool? = nil) {
        
        //set self view size
        self.frame.size = CGSize(width: width, height: height)
        
        //autoscall view size base on iPhone 5
        if autoscall == true {
            autoScallViewSize.base_on_iPhone5(self)
            width = self.frame.width
            height = self.frame.height
        }
        
        switch edgeType {
            
        case .AboveMatchingLeft :
            print("anchorAlign AboveMatchingLeft")
            
            //set location
            let origiView_MinY = CGRectGetMinY(relativeTo.frame)
            let origiView_MinX = CGRectGetMinX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MinX, origiView_MinY-gap-height, width, height)
            
        case .AboveCentered :
            print("anchorAlign AboveCentered")

            //set location
            let origiView_MinY = CGRectGetMinY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //center point
            let center_point_X = origiView_MaxX-(relativeTo.frame.width/2)
            //reloacation view
            self.frame = CGRectMake(center_point_X-width/2, origiView_MinY-gap-height, width, height)
            
        case .AboveMatchingRight :
            print("anchorAlign AboveMatchingRight")

            //set location
            let origiView_MinY = CGRectGetMinY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MaxX-width, origiView_MinY-gap-height, width, height)
            
        case .ToTheRightMatchingTop :
            print("anchorAlign ToTheRightMatchingTop")

            //set location
            let origiView_MinY = CGRectGetMinY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MaxX+gap, origiView_MinY, width, height)
            
        case .ToTheRightCentered :
            print("anchorAlign ToTheRightCentered")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //center point
            let center_point_Y = origiView_MaxY-(relativeTo.frame.height/2)
            //reloacation view
            self.frame = CGRectMake(origiView_MaxX+gap, center_point_Y-height/2, width, height)
            
        case .ToTheRightMatchingBottom :
            print("anchorAlign ToTheRightMatchingBottom")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MaxX+gap, origiView_MaxY-height, width, height)
            
        case .UnderMatchingRight :
            print("anchorAlign UnderMatchingRight")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MaxX-width, origiView_MaxY+gap, width, height)
            
        case .UnderCentered :
            print("anchorAlign UnderCentered")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MaxX = CGRectGetMaxX(relativeTo.frame)
            //center point
            let center_point_X = origiView_MaxX-(relativeTo.frame.width/2)
            //reloacation view
            self.frame = CGRectMake(center_point_X-width/2, origiView_MaxY+gap, width, height)
            
        case .UnderMatchingLeft :
            print("anchorAlign UnderMatchingLeft")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MinX = CGRectGetMinX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MinX, origiView_MaxY+gap, width, height)
            
        case .ToTheLeftMatchingBottom :
            print("anchorAlign ToTheLeftMatchingBottom")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MinX = CGRectGetMinX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MinX-gap-width, origiView_MaxY-height, width, height)
            
        case .ToTheLeftCentered :
            print("anchorAlign ToTheLeftMatchingBottom")

            //set location
            let origiView_MaxY = CGRectGetMaxY(relativeTo.frame)
            let origiView_MinX = CGRectGetMinX(relativeTo.frame)
            //center point
            let center_point_Y = origiView_MaxY-(relativeTo.frame.height/2)
            //reloacation view
            self.frame = CGRectMake(origiView_MinX-gap-width, center_point_Y-height/2, width, height)
            
        case .ToTheLeftMatchingTop :
            print("anchorAlign ToTheLeftMatchingTop")

            //set location
            let origiView_MinY = CGRectGetMinY(relativeTo.frame)
            let origiView_MinX = CGRectGetMinX(relativeTo.frame)
            //reloacation view
            self.frame = CGRectMake(origiView_MinX-gap-width, origiView_MinY, width, height)
            
        default :
            print("error anchorType not exist!")
            return
        }
        
        originView.addSubview(self)

        
    }
    
    //MARK: - anchorInCorner
    func anchorInCorner(originView:UIView, edgeType: anchorType, gap_x: CGFloat, gap_y:CGFloat, var width:CGFloat, var height:CGFloat, autoscall:Bool? = nil) {
        
        //set self view size
        self.frame.size = CGSize(width: width, height: height)
        //autoscall view size base on iPhone 5
        if autoscall == true {
            autoScallViewSize.base_on_iPhone5(self)
            width = self.frame.width
            height = self.frame.height
        }
        
        switch edgeType {
            
        case .TopLeft :
            print("anchorInCorner TopLeft")
            self.frame = CGRectMake(gap_x, gap_y, width, height)
        case .TopRight :
            print("anchorInCorner TopRight")
            self.frame = CGRectMake(originView.frame.width-gap_x-width, gap_y, width, height)
        case .BottomLeft :
            print("anchorInCorner BottomLeft")
            self.frame = CGRectMake(gap_x, originView.frame.height-gap_y-height, width, height)
        case .BottomRight :
            print("anchorInCorner BottomRight")
            self.frame = CGRectMake( originView.frame.width-gap_x-width, originView.frame.height-gap_y-height, width, height)
        default :
            print("error anchorType not exist!")
            return
        }
        
        originView.addSubview(self)
    }
    
    //MARK: - anchorFillingAndEdge
    func anchorFillingAndEdge(originView:UIView, edgeType: anchorType, gap_x: CGFloat, gap_y:CGFloat, var othersize:CGFloat, autoscall:Bool? = nil) {
        
        switch edgeType {
            
        case .Top :
            print("anchorFillingAndEdge Top")
            //set self view size
            self.frame.size = CGSize(width: originView.frame.width-gap_x*2, height: othersize )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, width_resize_only: false , height_resize_only: true )
                othersize = self.frame.height
            }
            self.frame = CGRectMake(gap_x, gap_y, originView.frame.width-gap_x*2, othersize)
                originView.addSubview(self)
                
        case .Bottom :
            print("anchorFillingAndEdge Bottom")
            //set self view size
            self.frame.size = CGSize(width: originView.frame.width-gap_x*2, height: othersize )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, width_resize_only: false , height_resize_only: true )
                othersize = self.frame.height
            }
            self.frame = CGRectMake(gap_x, originView.frame.height-gap_y-othersize, originView.frame.width-gap_x*2, othersize)
                originView.addSubview(self)
                
        case .Left :
            print("anchorFillingAndEdge Left")
            //set self view size
            self.frame.size = CGSize(width: othersize, height: originView.frame.height-gap_y*2 )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, width_resize_only: true , height_resize_only: false )
                othersize = self.frame.width
            }
            self.frame = CGRectMake(gap_x, gap_y, othersize, originView.frame.height-gap_y*2)
                originView.addSubview(self)
                
        case .Right :
            print("anchorFillingAndEdge Right")
            //set self view size
            self.frame.size = CGSize(width: othersize, height: originView.frame.height-gap_y*2 )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, width_resize_only: true , height_resize_only: false )
                othersize = self.frame.width
            }
            self.frame = CGRectMake(originView.frame.width-gap_x-othersize, gap_y, othersize, originView.frame.height-gap_y*2)
                originView.addSubview(self)
                
        default :
            print("error anchorType not exist!")
            return
        }
        
        
    }
    
    //MARK: - anchorAlignBetween
    func anchorAlignBetween(originView:UIView, primaryView:UIView, secondaryView:UIView , edgeType: anchorType, aligntype:anchorType , gap: CGFloat, var othersize:CGFloat, autoscall:Bool? = nil) {
        
        var size_width_now = CGFloat(0)
        var size_height_now = CGFloat(0)
        
        switch edgeType {
            
        case .AlignBetweenHorizontal :
            print("anchorAlignBetween alignBetweenHorizontal")
            if CGRectGetMaxX(secondaryView.frame) > CGRectGetMaxX(primaryView.frame) {
                size_width_now = CGRectGetMaxX(secondaryView.frame) - CGRectGetMaxX(primaryView.frame) - secondaryView.frame.width
                
            }else
            if CGRectGetMaxX(primaryView.frame) > CGRectGetMaxX(secondaryView.frame) {
                size_width_now = CGRectGetMaxX(primaryView.frame) - CGRectGetMaxX(secondaryView.frame) - primaryView.frame.width
            }
            
            size_width_now = size_width_now-gap*2
            if size_width_now <= 0 {
                print("error! size_width_now <= 0")
                return
            }
            
            //set self view size
            self.frame.size = CGSize(width: size_width_now, height: othersize )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, height_resize_only: true )
                othersize = self.frame.height
            }
            
            anchorAlign(originView, relativeTo: primaryView, edgeType: aligntype, gap: gap, width: self.frame.width, height: othersize)
        
                originView.addSubview(self)
                
        case .AlignBetweenVertical :
            print("anchorAlignBetween alignBetweenVertical")
            if CGRectGetMaxY(secondaryView.frame) > CGRectGetMaxY(primaryView.frame) {
                size_height_now = CGRectGetMaxY(secondaryView.frame) - CGRectGetMaxY(primaryView.frame) - primaryView.frame.height
                
            }else
            if CGRectGetMaxY(primaryView.frame) > CGRectGetMaxY(secondaryView.frame) {
                    size_height_now = CGRectGetMaxY(primaryView.frame) - CGRectGetMaxY(secondaryView.frame) - primaryView.frame.height
            }
            
            size_height_now = size_height_now-gap*2
            if size_height_now <= 0 {
                print("error! size_height_now <= 0")
                return
            }
            
            //set self view size
            self.frame.size = CGSize(width: othersize, height: size_height_now )
            //autoscall view size base on iPhone 5
            if autoscall == true {
                autoScallViewSize.base_on_iPhone5(self, width_resize_only: true)
                othersize = self.frame.width
            }
            
            anchorAlign(originView, relativeTo: primaryView, edgeType: aligntype, gap: gap, width: othersize, height: size_height_now)
            
                originView.addSubview(self)
                
            
        default:
            print("error anchorType not exist!")
            return
        }
        
    }
    
    //MARK: - anchorGrouping
    func anchorGrouping( arrayView: NSArray , groupin: groupInType , orientation: orientationType ,  gap: CGFloat , var width:CGFloat, var height:CGFloat, autoscall:Bool? = nil ,sizeToFit:Bool? = nil) {
        //check views count
        let counts_View = arrayView.count
        if counts_View <= 1 {
            print("error counts_View <= 1")
            return
        }
        //set up
        var total_views_width = CGFloat(0)
        var total_views_height = CGFloat(0)
        var proportion = CGFloat(1)
        let base_view_width = self.frame.width
        let base_view_height = self.frame.height
        let gap_count = arrayView.count - 1
        
        //layout frist view
        let frist_view = arrayView[0] as! UIView
        frist_view.frame.size = CGSize(width: width, height: height)
        //autoscall view size base on iPhone 5
        if autoscall == true && groupin != .groupAndFill {
            autoScallViewSize.base_on_iPhone5(frist_view)
            width = frist_view.frame.width
            height = frist_view.frame.height
        }
        
        switch groupin {
            
        //MARK: - groupInCenter
        case .groupInCenter :

            switch orientation {
                
            case .Horizontal :
 
                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)

                //get minX and MinY
                var minX = base_view_width/2 - total_views_width/2
                var minY = base_view_height/2 - height/2
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    minX = gap
                    minY = base_view_height/2 - height/2*proportion
                    width = new_width
                    height = height*proportion
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical :

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width/2 - width/2
                var minY = base_view_height/2-total_views_height/2
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    minX = base_view_width/2 - width/2*proportion
                    minY = gap
                    width = width*proportion
                    height =  new_height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupInCorner_TopLeft
        case .groupInCorner_TopLeft :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = gap
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    minX = gap
                    minY = gap
                    width = new_width
                    height = height*proportion
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }

                
            case .Vertical:
 
                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = gap
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    minX = gap
                    minY = gap
                    width = width*proportion
                    height =  new_height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
            
        //MARK: - groupInCorner_TopRight
        case .groupInCorner_TopRight :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = base_view_width-gap-width
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    minX =  base_view_width-gap-new_width
                    minY = gap
                    width = new_width
                    height = height*proportion
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheLeftCentered, gap: gap, width: width, height: height)
                    
                }
                
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width-gap-width
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    minX = base_view_width-gap-new_height
                    minY = gap
                    width = width*proportion
                    height =  new_height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupInCorner_BottomLeft
        case .groupInCorner_BottomLeft :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = gap
                var minY = base_view_height-gap-height
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    minX = gap
                    minY = base_view_height-gap-height*proportion
                    width = new_width
                    height = height*proportion
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = gap
                var minY = base_view_height-gap-height
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                    minX = gap
                    minY = base_view_height-gap-height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.AboveCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupInCorner_BottomRight
        case .groupInCorner_BottomRight :
            
            switch orientation {
                
            case .Horizontal:
 
                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = base_view_width-gap-width
                var minY = base_view_height-gap-height
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    width = new_width
                    height = height*proportion
                     minX = base_view_width-gap-width
                     minY = base_view_height-gap-height
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheLeftCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width-gap-width
                var minY = base_view_height-gap-height
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                     minX = base_view_width-gap-width
                     minY = base_view_height-gap-height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.AboveCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupAgainstEdge_Top
        case .groupAgainstEdge_Top :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = base_view_width/2-width/2
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width/2 && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = ((base_view_width/2+width/2) - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    width = new_width
                    height = height*proportion
                     minX = base_view_width/2-width/2
                     minY = gap
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width/2-width/2
                var minY = gap
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                     minX = base_view_width/2-width/2
                     minY = gap
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupAgainstEdge_Left
        case .groupAgainstEdge_Left :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = gap
                var minY = base_view_height/2-height/2
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    width = new_width
                    height = height*proportion
                     minX = gap
                     minY = base_view_height/2-height/2
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = gap
                var minY = base_view_height/2-height/2
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height/2 && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = ((base_view_height/2+height/2) - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                     minX = gap
                     minY = base_view_height/2-height/2
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupAgainstEdge_Bottom
        case .groupAgainstEdge_Bottom :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = base_view_width/2 - width/2
                var minY = base_view_height - gap/proportion - height
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width/2 && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = ((base_view_width/2 + width/2) - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    width = new_width
                    height = height*proportion
                     minX = base_view_width/2 - width/2
                     minY = base_view_height - gap - height
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:

                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width/2 - width/2
                var minY = base_view_height - gap - height
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                     minX = base_view_width/2 - width/2
                     minY = base_view_height - gap - height
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.AboveCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
            //MARK: - groupAgainstEdge_Right
        case .groupAgainstEdge_Right :
            
            switch orientation {
                
            case .Horizontal:

                total_views_width = (CGFloat(counts_View)*width) + (CGFloat(gap_count)*gap)
                
                //get minX and MinY
                var minX = base_view_width - gap - width
                var minY = base_view_height/2 - height/2
                //check if total width > base view width, set fit size
                if total_views_width+gap*2 > base_view_width && sizeToFit == true {
                    //set total gaps width
                    let total_gap_width =  (CGFloat(counts_View+1))*gap
                    let new_width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                    proportion = new_width / width
                    //resize to fit
                    width = new_width
                    height = height*proportion
                     minX = base_view_width - gap - width
                     minY = base_view_height/2 - height/2
                }
                
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheLeftCentered, gap: gap, width: width, height: height)
                    
                }
                
            case .Vertical:
                
                total_views_height = (CGFloat(counts_View)*height) + (CGFloat(gap_count)*gap)
                //get minX and MinY
                var minX = base_view_width - gap - width
                var minY = base_view_height/2 - height/2
                //check if total width > base view width, set fit size
                if total_views_height+gap*2 > base_view_height/2 && sizeToFit == true {
                    //set total gaps height
                    let total_gap_height =  (CGFloat(counts_View+1))*gap
                    let new_height = ((base_view_height/2+height/2) - total_gap_height)/CGFloat(counts_View)
                    proportion = new_height / height
                    //resize to fit
                    width = width*proportion
                    height =  new_height
                     minX = base_view_width - gap - width
                     minY = base_view_height/2 - height/2
                }
                frist_view.frame = CGRectMake(minX, minY, width, height)
                
                    self.addSubview(frist_view)
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height)
                    
                }
                
            }
            
        //MARK: - groupAndFill
        case .groupAndFill :
            print("groupAndFill")
            
            switch orientation {
                
            case .Horizontal:
                print("Horizontal")
                //autoscall view size base on Origin view
                height = self.frame.height - gap*2
                let total_gap_width =  (CGFloat(counts_View+1))*gap
                width = (self.frame.width - total_gap_width)/CGFloat(counts_View)
                frist_view.frame = CGRectMake(gap, gap, width, height)
                self.addSubview(frist_view)
                
                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.ToTheRightCentered, gap: gap, width: width, height: height )
                    
                }
                
            case .Vertical :
                print("Vertical")
                //autoscall view size base on Origin view
                width = self.frame.width - gap*2
                let total_gap_height =  (CGFloat(counts_View+1))*gap
                height = (self.frame.height - total_gap_height)/CGFloat(counts_View)
                frist_view.frame = CGRectMake(gap, gap, width, height)
                self.addSubview(frist_view)

                //layout other views
                for var i=1;i<counts_View;i++ {
                    let view_now = arrayView[i] as! UIView
                    let relativeTo_view_now = arrayView[i-1] as! UIView
                    view_now.anchorAlign(self, relativeTo: relativeTo_view_now, edgeType: anchorType.UnderCentered, gap: gap, width: width, height: height )
                    
                }
                
            }
            
            
//        default:
//            print("error groupInType not exist!")
//            return
//       END Switch
        }
        
//   END func
    }
    
    
}






















