//
//  HMError.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import Alamofire
import Foundation
import Moya

public let kNetworkErrorMessage = "网络请求失败: 未知错误"

// MARK: -HMError

public struct HMError: Error {
    /// 错误码
    public var code: Int

    /// 错误信息
    public var message: String?

    public init(code: Int, message: String? = nil) {
        self.code = code
        self.message = message
    }

    public var localizedDescription: String {
        if let msg = message,msg.count > 0{
            return msg
        }else{
            return "请求/操作失败: 未知错误"
        }
    }
}

// MARK: -错误描述信息

public extension Error {
    /// 生成默认netReponseFailed错误
    /// - Parameters:
    ///   - message: 错误信息描述
    ///   - placeHolder: 为空时默认信息描述
    /// - Returns: HMError
    static func netReponseFailed(message: String?, placeHolder: String = kNetworkErrorMessage) -> HMError {
        var msg = placeHolder
        if let m = message, m.count > 0 {
            msg = m
        }

        if msg.count == 0 {
            msg = kNetworkErrorMessage
        }
        return HMError(code: -999, message: msg)
    }

    /// 获取错误描述信息
    /// - Parameter placeHolder: 为空时默认信息描述
    /// - Returns: 错误描述信息
    func message(placeHolder: String = kNetworkErrorMessage) -> String {
        var message = placeHolder
        switch self {
        case let err as URLError:
            message = err.zhDescription
        case let err as AFError:
            message = err.zhDescription
        case let err as MoyaError:
            message = err.zhDescription
        case let err as HMError:
            message = err.message ?? ""
        default:
            message = localizedDescription
        }
        return message.count > 0 ? message : kNetworkErrorMessage
    }
}
