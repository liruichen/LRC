//
//  LimitFreeViewController.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit
import XWSwiftRefresh
class LimitFreeViewController: LFNavViewController {

    private lazy var dataSource = Array<LimitModel>()
    
    var tbView: UITableView?
    
    var currentPage = 1
    
    func createTableView() {
        
        automaticallyAdjustsScrollViewInsets = false
        tbView = UITableView(frame: CGRectMake(0, 64, kScreenW, kScreenH-64-49), style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
        //下拉刷新
        tbView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadFirstPage))
        
        //上啦加载
        tbView?.footerView = XWRefreshAutoFooter(target: self, action: #selector(loadNextPage))
    }
    
    func loadFirstPage() {
        currentPage = 1
        downloadData()
    }
    func loadNextPage() {
        currentPage += 1
        downloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        createNav()
        downloadData()
        createTableView()
        
    }

    func createNav() {
     
        addNavButton("分类", target: self, action: #selector(gotoCategory), isLeft: true)
        addNavButton("设置", target: self, action: #selector(gotoSetPage), isLeft: false)
        addNavTitle("限免")
    }
    
    func gotoCategory() {
        
    }
    
    func gotoSetPage() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func downloadData() {
        ProgressHUD.showOnView(view)
        
        let dl = LFDownloader()
        dl.delegate = self
        
        let urlS = String(format: kLimitUrl, currentPage)
        dl.downloadWithurl(urlS)
    }
    

}

extension LimitFreeViewController: LFDownloaderDelegate {
    
    func downloader(downloader: LFDownloader, didFailWithError error: NSError) {
        ProgressHUD.hideAfterFailOnView(view)
    }
    
    func downloader(downloader: LFDownloader, didFinishWithData data: NSData) {
        
        //let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        //print(str)
        
        //这段代码应该写在下载结束的地方
        if currentPage == 1 {
            //清空数组
            dataSource.removeAll()
        }
        //----end
        
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        if result.isKindOfClass(NSDictionary) {
            let dict = result as! Dictionary<String, AnyObject>
            let arr = dict["applications"] as! Array<Dictionary<String, AnyObject>>
            
            for dic in arr {
                let model = LimitModel()
                model.setValuesForKeysWithDictionary(dic)
                
                dataSource.append(model)
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                self.tbView?.reloadData()
                //结束刷新
                self.tbView?.headerView?.endRefreshing()
                self.tbView?.footerView?.endRefreshing()
                
                ProgressHUD.hideAfterSuccessOnView(self.view)
            })
        }
     
    }
}
//MARK: UITableView代理
extension LimitFreeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "limitCellId"
        var cell = tbView?.dequeueReusableCellWithIdentifier(cellId) as? LimitTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("LimitTableViewCell", owner: nil, options: nil).last as? LimitTableViewCell
        }
        cell?.selectionStyle = .None
        //显示数据
        let model = dataSource[indexPath.row]
        cell?.config(model, atIndex: indexPath.row+1)
        return cell!
    }
    
}



