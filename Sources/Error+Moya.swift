//
//  Error+Moya.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import Moya

extension MoyaError {
    public var zhDescription: String {
        switch self {
        case .imageMapping:
            return "Image解析失败"
        case .jsonMapping:
            return "JSON解析失败"
        case .stringMapping:
            return "String解析失败"
        case .objectMapping:
            return "无法将数据映射到可解码对象"
        case .encodableMapping:
            return "无法将可编码对象编码"
        case .statusCode(let res):
            return "响应状态码不在指定范围内:\(res.statusCode)"
        case .underlying(let error, _):
            return error.message()
        case .requestMapping:
            return "无法将端点映射到URLRequest"
        case let .parameterEncoding(error):
            return "无法为URLRequest编码参数: \(error.message())"
        }
    }
}
