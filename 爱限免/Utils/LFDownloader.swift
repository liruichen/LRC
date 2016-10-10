//
//  LFDownloader.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

protocol LFDownloaderDelegate: NSObjectProtocol {
    func downloader(downloader: LFDownloader,didFailWithError error: NSError)
    func downloader(downloader: LFDownloader,didFinishWithData data: NSData)
}

class LFDownloader: NSObject {

    // 代理属性
    weak var delegate: LFDownloaderDelegate?
    
    func downloadWithurl(urlStr: String) {
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            if let error = error {
                print(error.description)
                self.delegate?.downloader(self, didFailWithError: error)
            }else {
                let hResponse = response as! NSHTTPURLResponse
                if hResponse.statusCode == 200 {
                    
                    self.delegate?.downloader(self, didFinishWithData: data!)
                    
                }else {
                    let err = NSError(domain: urlStr, code: hResponse.statusCode, userInfo: ["mag": "Fail"])
                    
                    self.delegate?.downloader(self, didFailWithError: err)
                    
                }
            }
        }
        
        task.resume()
    }
}
