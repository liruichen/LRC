//
//  LFNavViewController.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

class LFNavViewController: UIViewController {

    func addNavTitle(title: String) {
    
        let label = UILabel.createLabel(CGRectMake(0, 0, 215, 44), title: title, textAlignment: .Center)
        label.font = UIFont.boldSystemFontOfSize(25)
        label.textColor = UIColor(red: 58/255.0, green: 95/255.0, blue: 145/255.0, alpha: 1)
        navigationItem.titleView = label
    }
    
    func addNavButton(title:String, target: AnyObject?, action: Selector, isLeft: Bool) {
        let btn = UIButton.createButton(CGRectMake(0, 0, 60, 36), title: title, bgImage: "buttonbar_action", target: target, action: action)
        
        let barButton = UIBarButtonItem(customView: btn)
        
        if isLeft {
            navigationItem.leftBarButtonItem = barButton
        }else {
            navigationItem.rightBarButtonItem = barButton
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
