//
//  MainViewController.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blueColor()], forState: .Selected)
        createViewControllers()
          
    }

    func createViewControllers() {
       
        let titles = ["限免", "降价", "免费", "专题", "热榜"]
        let images = ["tabbar_limitfree", "tabbar_reduceprice", "tabbar_appfree", "tabbar_subject", "tabbar_rank"]
        
        
        let controllers = ["爱限免.LimitFreeViewController", "爱限免.ReduceViewController", "爱限免.FreeViewController", "爱限免.SubjectViewController", "爱限免.RankViewController"]
        
        var navs = Array<UINavigationController>()
        
        for i in 0..<titles.count {
            let cName = controllers[i]
            let cl = NSClassFromString(cName) as! UIViewController.Type
            let vc = cl.init()
            
            //tab标题
            vc.tabBarItem.title = titles[i]
            
            //tab图片
            let imName = images[i]
            vc.tabBarItem.image = UIImage(named: imName)
            vc.tabBarItem.selectedImage = UIImage(named: (imName+"_press"))?.imageWithRenderingMode(.AlwaysOriginal)
            
            //导航
            let nv = UINavigationController(rootViewController: vc)
            navs.append(nv)
            
            viewControllers = navs
        }
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
