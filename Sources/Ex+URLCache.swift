//
//  Ex+URLCache.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import Foundation

public extension URLCache {
    /// 通过key,获取缓存Data
    /// - Parameter key: key
    func getCacheData(key: String) -> Data? {
        let urlStr = "https://www.apple.com/" + key.md5()
        guard let url = URL(string: urlStr) else {
            print("缓存数据获取失败")
            return nil
        }

        let request = URLRequest(url: url)

        let cachedResponse = self.cachedResponse(for: request)

        if let data = cachedResponse?.data {
            return data
        }
        return nil
    }

    /// 通过key 存储缓存
    /// - Parameter key: key
    /// - Parameter data: 数据Data
    /// - Parameter response: 响应
    func storeCacheData(key: String, data: Data, response: URLResponse) {
        let cachedResp = CachedURLResponse(response: response, data: data)
        let urlStr = "https://www.apple.com/" + key.md5()
        guard let url = URL(string: urlStr) else {
            print("数据缓存失败")
            return
        }
        let request = URLRequest(url: url)
        storeCachedResponse(cachedResp, for: request)
    }
}
