//
//  ViewController.swift
//  MeiTuanDemo
//
//  Created by randy on 15/9/23.
//  Copyright © 2015年 randy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,ItemSelectedDelegate {
    var arr:[Int] = [1]
    var _expandIndexPath:NSIndexPath?
    var menuView:MenuView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.separatorColor = UIColor.clearColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arr.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if menuView?.firstItemSelected == true
        {
            return 120.0
        }
        else
        {
            return 55.0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        for view in (cell?.contentView.subviews)!
        {
            view.removeFromSuperview()
        }
        if indexPath.section == 0
        {
            if menuView == nil
            {
                menuView = MenuView(frame: CGRectMake(0, 0, tableView.frame.size.width, 55))
                menuView!.delegate = self
            }
            let view = UIView(frame: CGRectMake(0, 55, tableView.frame.size.width, 65))
            view.backgroundColor = UIColor.orangeColor()
            cell?.addSubview(view)
            cell?.contentView.addSubview(menuView!)
        }
        //cell?.textLabel?.text = String(format: "%d", indexPath.row)
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func firstItemPressed(menuView: MenuView, firstItem:UIButton) {
        var modifiedRows:[NSIndexPath] = []
        // Deselect cell
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        _expandIndexPath = indexPath;
        modifiedRows.append(indexPath)
        
        // This will animate updating the row sizes
        tableView.reloadRowsAtIndexPaths(modifiedRows, withRowAnimation: UITableViewRowAnimation.Automatic)
        menuView.selectItem(firstItem)
    }
    
    func secondItemPressed(menuView:MenuView,secondItem:UIButton)
    {
        
    }
    
    func thirdItemPressed(menuView:MenuView,thirdItem:UIButton)
    {
        
    }

    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UIView(frame: CGRectZero)
//    }
//    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView(frame: CGRectZero)
//    }
//    
//    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0
//        {
//            return 8
//        }
//        return 4.0
//    }
//    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 4.0
//    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

