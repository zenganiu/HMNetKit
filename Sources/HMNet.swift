//
//  HMNet.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/30.
//  Copyright © 2020 huimin. All rights reserved.
//

import Moya
import SwiftyJSON


/// 网络封装的的通用方法
public enum HMNet {}

public extension HMNet {
    /// 收到http响应码状态闭包
    static var didRecvStatusCodeBlock: ((Response) -> Void)?
    
    
    /// 获取异常信息
    /// - Parameters:
    ///   - keys: 异常信息对应的key
    ///   - json: json数据
    ///   - defaultMessage: 空时默认的描述
    /// - Returns: 异常信息
    static func errorMessage(keys: String..., json: JSON, defaultMessage: String = "") -> String {
        for key in keys {
            let msg = json[key].stringValue
            if msg.count > 0 {
                return msg
            }
        }
        return ""
    }
    
    
    /// 获取异常信息, key:["msg","message","Msg","Message"]
    /// - Parameters:
    ///   - json: json数据
    ///   - defaultMessage: 空时默认的描述
    /// - Returns: 异常信息
    static func errorMessage(json: JSON,defaultMessage: String = "") -> String{
        return errorMessage(keys: "msg","message","Msg","Message", json: json, defaultMessage: defaultMessage)
    }
    
    
    /// 发起响应数据为JSON格式的请求
    /// - Parameters:
    ///   - provider: 提供者
    ///   - target: 端点
    ///   - successBlock: 成功回调
    ///   - failureBlock: 失败回调
    /// - Returns: 可取消对象
    @discardableResult
    static func requestJson<T: TargetType>(provider: MoyaProvider<T>,
                                           target: T,
                                           successBlock: @escaping (JSON, Response) -> Void,
                                           failureBlock: @escaping (Error) -> Void) -> Cancellable {
        return requestResp(provider: provider, target: target, successBlock: { resp in

            do {
                let jsAny = try resp.filterSuccessfulStatusCodes().mapJSON()
                let js = JSON(jsAny)
                successBlock(js, resp)
            } catch {
                failureBlock(error)
            }

        }, failureBlock: {
            error in
            failureBlock(error)
        })
    }
    
    /// 发起请求
    /// - Parameters:
    ///   - provider: 提供者
    ///   - target: 端点
    ///   - successBlock: 成功回调
    ///   - failureBlock: 失败回调
    /// - Returns: 可取消对象
    @discardableResult
    static func requestResp<T: TargetType>(provider: MoyaProvider<T>,
                                           target: T,
                                           successBlock: @escaping (Response) -> Void,
                                           failureBlock: @escaping (Error) -> Void) -> Cancellable {
        return provider.request(target) { result in

            switch result {
            case let .success(resp):
                
                didRecvStatusCodeBlock?(resp)
                successBlock(resp)

            case let .failure(error):

                failureBlock(error)
            }
        }
    }
}
