//
//  Error+URL.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import Foundation

public extension URLError{
    
    var zhDescription: String{
        
        var message: String = "网络请求失败"
        switch self{
            
        case URLError.unknown:
            message = "无效的URL地址"
        case URLError.cancelled:
            message = "取消请求"
        case URLError.unsupportedURL:
            message = "不支持的URL地址"
        case URLError.cannotFindHost:
            message = "找不到服务器"
        case URLError .cannotConnectToHost:
            message = "连接不上服务器"
        case URLError.dataLengthExceedsMaximum:
            message = "请求数据长度超出最大限度"
        case URLError.networkConnectionLost:
            message = "网络连接异常"
        case URLError.dnsLookupFailed:
            message = "DNS查询失败"
        case URLError.httpTooManyRedirects:
            message = "HTTP请求重定向"
        case URLError.resourceUnavailable:
            message = "资源不可用"
        case URLError.notConnectedToInternet:
            message = "无网络连接"
        case URLError.timedOut:
            message = "请求超时，请检查网络"
        case URLError.redirectToNonExistentLocation:
            message = "重定向到不存在的位置"
        case URLError.badServerResponse:
            message = "服务器响应异常"
        case URLError.userCancelledAuthentication:
            message = "用户取消授权"
        case URLError.userAuthenticationRequired:
            message = "需要用户授权"
        case URLError.zeroByteResource:
            message = "零字节资源"
        case URLError.cannotDecodeRawData:
            message = "无法解码原始数据"
        case URLError.cannotDecodeContentData:
            message = "无法解码内容数据"
        case URLError.cannotParseResponse:
            message = "无法解析响应"
        case URLError.internationalRoamingOff:
            message = "国际漫游关闭"
        case URLError.callIsActive:
            message = "被叫激活"
        case URLError.dataNotAllowed:
            message = "数据不被允许"
        case URLError.fileDoesNotExist:
            message = "文件不存在"
        case URLError.fileIsDirectory:
            message = "文件是个目录"
        case URLError.noPermissionsToReadFile:
            message = "无读取文件权限"
        case URLError.secureConnectionFailed:
            message = "安全连接失败"
        case URLError.serverCertificateHasBadDate:
            message = "服务器证书失效"
        case URLError.serverCertificateNotYetValid:
            message = "服务器证书未生效"
        case URLError.serverCertificateHasUnknownRoot:
            message = "未知Root的服务器证书"
        case URLError.serverCertificateUntrusted:
            message = "不被信任的服务器证书"
            
        case URLError.clientCertificateRejected:
            message = "客户端证书被拒"
        case URLError.clientCertificateRequired:
            message = "需要客户端证书"
            
        case URLError.cannotLoadFromNetwork:
            message = "无法从网络获取"
        case URLError.cannotCreateFile:
            message = "无法创建文件"
        case URLError.cannotOpenFile:
            message = "无法打开文件"
        case URLError.cannotCloseFile:
            message = "无法关闭文件"
        case URLError.cannotWriteToFile:
            message = "无法写入文件"
        case URLError.cannotRemoveFile:
            message = "无法删除文件"
        case URLError.cannotMoveFile:
            message = "无法移动文件"
            
        case URLError.downloadDecodingFailedMidStream:
            message = "下载解码数据失败"
        case URLError.downloadDecodingFailedToComplete:
            message = "下载解码数据失败"
            
        default:
            break
        }
        return message
    }
    
    
}
