//
//  MenuView.swift
//  MeiTuanDemo
//
//  Created by randy on 15/9/25.
//  Copyright © 2015年 randy. All rights reserved.
//

import UIKit
protocol ItemSelectedDelegate
{
    func firstItemPressed(menuView:MenuView,firstItem:UIButton)
    func secondItemPressed(menuView:MenuView,secondItem:UIButton)
    func thirdItemPressed(menuView:MenuView,thirdItem:UIButton)
}
@IBDesignable

class MenuView: UIView {
    var triangle1:CAShapeLayer = CAShapeLayer()
    var triangle2:CAShapeLayer = CAShapeLayer()
    var triangle3:CAShapeLayer = CAShapeLayer()
    var firstItemSelected:Bool = false
    var secondItemSelected:Bool = false
    var thirdItemSelected:Bool = false
    var delegate:ItemSelectedDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createSeparatorAtFrame(rect:CGRect)
    {
        let separator1 = CAShapeLayer()
        let path1 = UIBezierPath()
        path1.moveToPoint(CGPointMake(rect.width/3, 10))
        path1.addLineToPoint(CGPointMake(rect.width/3, 40))
        separator1.strokeColor = UIColor.lightGrayColor().CGColor
        separator1.lineWidth = 0.5
        separator1.path = path1.CGPath
        layer.addSublayer(separator1)
        
        let separator2 = CAShapeLayer()
        let path2 = UIBezierPath()
        path2.moveToPoint(CGPointMake(rect.width/3*2, 10))
        path2.addLineToPoint(CGPointMake(rect.width/3*2, 40))
        separator2.strokeColor = UIColor.lightGrayColor().CGColor
        separator2.lineWidth = 0.5
        separator2.path = path2.CGPath
        layer.addSublayer(separator2)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        createSeparatorAtFrame(rect)
        //drawTrianles(rect)
        let btn1 = UIButton(type: .Custom)
        btn1.frame = CGRectMake(10, 5, rect.size.width/3-20, 40)
        btn1.setTitle("优惠多多", forState: .Normal)
        btn1.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addSubview(btn1)
        triangle1.frame = CGRectMake(btn1.frame.size.width - 15, btn1.frame.size.height/2-10, 15, 15)
        triangle1.contents = UIImage(named: "arrow-up")!.CGImage
        btn1.layer.addSublayer(triangle1)
        btn1.addTarget(self, action: "button1Pressed:", forControlEvents: .TouchUpInside)
        let btn2 = UIButton(type: .Custom)
        btn2.frame = CGRectMake(rect.size.width/3+10, 5, rect.size.width/3-20, 40)
        btn2.setTitle("多个铲铲", forState: .Normal)
        btn2.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn2.addTarget(self, action: "button2Pressed:", forControlEvents: .TouchUpInside)

        addSubview(btn2)
        triangle2.frame = CGRectMake(btn1.frame.size.width - 15, btn1.frame.size.height/2-10, 15, 15)
        triangle2.contents = UIImage(named: "arrow-up")!.CGImage
        btn2.layer.addSublayer(triangle2)
        let btn3 = UIButton(type: .Custom)
        btn3.frame = CGRectMake(rect.size.width/3*2+10, 5, rect.size.width/3-20, 40)
        btn3.setTitle("你上当啦", forState: .Normal)
        btn3.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addSubview(btn3)
        btn3.addTarget(self, action: "button3Pressed:", forControlEvents: .TouchUpInside)

        triangle3.frame = CGRectMake(btn1.frame.size.width - 15, btn1.frame.size.height/2-10, 15, 15)
        triangle3.contents = UIImage(named: "arrow-up")!.CGImage
        btn3.layer.addSublayer(triangle3)
    }
    
    func button1Pressed(sender:UIButton)
    {
        firstItemSelected = !firstItemSelected
        print("\(firstItemSelected)")
        self.delegate?.firstItemPressed(self, firstItem: sender)
    }
    
    func selectItem(item:UIButton)
    {
        if(firstItemSelected)
        {
            print("dd")
            item.setTitleColor(UIColor(red: 33/255, green: 215/255, blue: 184/255, alpha: 1.0), forState: .Normal)
            triangle1.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)

        }
        else
        {
            item.setTitleColor(UIColor.blackColor(), forState: .Normal)
            triangle1.transform = CATransform3DIdentity
        }
    }
    
    func button2Pressed(sender:UIButton)
    {
        sender.selected = !sender.selected
        if sender.selected
        {
            sender.setTitleColor(UIColor(red: 33/255, green: 215/255, blue: 184/255, alpha: 1.0), forState: .Normal)
            triangle2.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
            //            triangle1.transform = CATransform3DTranslate(triangle1.transform, 0, 20, 0)
        }
        else
        {
            sender.setTitleColor(UIColor.blackColor(), forState: .Normal)
            triangle2.transform = CATransform3DIdentity
        }
    }

    func button3Pressed(sender:UIButton)
    {
        sender.selected = !sender.selected
        if sender.selected
        {
            sender.setTitleColor(UIColor(red: 33/255, green: 215/255, blue: 184/255, alpha: 1.0), forState: .Normal)
            triangle3.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
            //            triangle1.transform = CATransform3DTranslate(triangle1.transform, 0, 20, 0)
        }
        else
        {
            sender.setTitleColor(UIColor.blackColor(), forState: .Normal)
            triangle3.transform = CATransform3DIdentity
        }
    }

}
