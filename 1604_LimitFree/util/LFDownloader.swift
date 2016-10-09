//
//  LFDownloader.swift
//  1604_LimitFree
//
//  Created by gaokunpeng on 16/9/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit


//下载的类型
public enum DownloadType: Int {
    
    case Default    //默认值
    case Detail     //详情数据
    case NearBy     //详情页的附近
    
}

protocol LFDownloaderDelegate: NSObjectProtocol {
    
    //下载失败
    func downloader(downloder: LFDownloader, didFailWithError error: NSError)
    //下载成功
    func downloader(downloader: LFDownloader, didFinishWithData data: NSData)
    
}


class LFDownloader: NSObject {
    
    
    //下载类型
    var type: DownloadType = .Default
    
    //代理属性
    weak var delegate: LFDownloaderDelegate?
    
    
    //获取缓存文件的路径
    func cachePath(urlString: String) -> String {
        
        let fileName = NSString(string: urlString).MD5Hash()
        let docDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
        return docDir! + "/" + fileName
        
    }
    
    //判断是否存储了缓存
    func urlStringDataCached(urlString: String, timeout time: NSTimeInterval) -> Bool {
        
        let path = cachePath(urlString)
        
        //文件存在，就说明缓存过了
        let fm = NSFileManager.defaultManager()
        
        
        
        if fm.fileExistsAtPath(path) {
            
            let dict = try! fm.attributesOfItemAtPath(path)
            let createDate = dict[NSFileCreationDate] as! NSDate
            
            //计算时间差
            let timeInterval = NSDate().timeIntervalSinceDate(createDate)
            if (timeInterval < time) {
                return true
            }
            
        }
        
        return false
    }
    
    //下载方法
    func downloadWithURLString(urlString: String) {
        
        //超时时间为24小时
        if urlStringDataCached(urlString, timeout: 24*60*60) {
            //如果有缓存，就读缓存文件的数据
            
            let path = cachePath(urlString)
            
            //读文件
            let data = NSData(contentsOfFile: path)
            
            delegate?.downloader(self, didFinishWithData: data!)
            
            
        }else{
            //如果没有缓存，发送网络请求
            
            //1.创建NSURL对象
            let url = NSURL(string: urlString)
            
            //2.创建NSURLRequest对象
            let request = NSURLRequest(URL: url!)
            
            //3.获取NSURLSession对象
            let session = NSURLSession.sharedSession()
            
            //4.创建NSURLSessionDataTask对象
            let task = session.dataTaskWithRequest(request) { (data, response, error) in
                
                if let tmpError = error {
                    //下载失败
                    self.delegate?.downloader(self, didFailWithError: tmpError)
                    
                }else{
                    let httpResponse = response as! NSHTTPURLResponse
                    if httpResponse.statusCode == 200 {
                        //下载成功
                        self.delegate?.downloader(self, didFinishWithData: data!)
                        //存缓存
                        let path = self.cachePath(urlString)
                        try! data?.writeToFile(path, options: .DataWritingAtomic)
                        
                        
                    }else {
                        //下载失败
                        let err = NSError(domain: urlString, code: httpResponse.statusCode, userInfo: ["msg": "下载失败"])
                        self.delegate?.downloader(self, didFailWithError: err)
                    }
                }
                
            }
            
            //5.开启下载
            task.resume()
            
        }

    }

}
