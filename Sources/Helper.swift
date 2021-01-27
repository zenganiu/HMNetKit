//
//  Helper.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import CommonCrypto
import Foundation

internal extension String {
    // MARK: -字符串url转换为URL对象

    /// 字符串url转换为URL对象
    func url() throws -> URL {
        guard let url = URL(string: self) else {
            throw HMError(code: -999, message: "域名错误")
        }
        return url
    }

    // MARK: -md5加密

    /// md5加密
    /// - Parameter digit: 字符位数；默认16位
    func md5(digit: Int = 16) -> String {
        guard let cStr = self.cString(using: .utf8) else {
            return ""
        }
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: digit)
        CC_MD5(cStr, CC_LONG(strlen(cStr)), buffer)
        var md5Str = String()
        for i in 0 ..< digit {
            md5Str += String(format: "%02x", buffer[i])
        }
        free(buffer)
        return md5Str
    }
}

internal extension Data {
    // MARK: -二进制data数据转换为String;  UTF8编码

    /// 二进制data数据转换为String;  UTF8编码
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}

// MARK: -字典按顺序转换为数据

/// 字典按顺序转换为数组
/// - Parameter dict: 字典
public func kSortToArray(dict: [String: Any]) -> [(key: String, value: Any)] {
    var dic = dict.sorted { $0.key > $1.key }
    for (idx, val) in dic.enumerated() {
        if let v = val.value as? [String: Any] {
            dic[idx] = (val.key, kSortToArray(dict: v))
        } else if let v = val.value as? [[String: Any]] {
            let sv = v.flatMap { kSortToArray(dict: $0) }
            dic[idx] = (val.key, sv)
        }
    }
    return dic
}
