//
//  Error+AF.swift
//  HMNetKit
//
//  Created by huimin on 2020/5/7.
//  Copyright © 2020 huimin. All rights reserved.
//

import Alamofire
import Foundation

public extension AFError {
    var zhDescription: String {
        switch self {
        case .explicitlyCancelled:
            return "请求已经取消"
        case let .invalidURL(url):
            return "无效URL: \(url)"
        case let .parameterEncodingFailed(reason):
            return reason.zhDescription
        case let .parameterEncoderFailed(reason):
            return reason.zhDescription
        case let .multipartEncodingFailed(reason):
            return reason.zhDescription
        case let .requestAdaptationFailed(error):
            return "请求适配失败: \(error.message())"
        case let .responseValidationFailed(reason):
            return reason.zhDescription
        case let .responseSerializationFailed(reason):
            return reason.zhDescription
        case let .requestRetryFailed(retryError, originalError):
            return """
            请求重试失败,错误: \(retryError.message()), \
            原始错误: \(originalError.message())
            """
        case .sessionDeinitialized:
            return """
            会话无效而没有错误，因此它可能被意外地初始化了
            """
        case let .sessionInvalidated(error):
            return "会话无效: \(error?.message() ?? "No description.")"
        case let .serverTrustEvaluationFailed(reason):
            return "服务器信任原因而失败: \(reason.zhDescription)"
        case let .urlRequestValidationFailed(reason):
            return "URLRequest验证失败: \(reason.zhDescription)"
        case let .createUploadableFailed(error):
            return "可上传的创建失败: \(error.message())"
        case let .createURLRequestFailed(error):
            return "URLRequest创建失败: \(error.message())"
        case let .downloadedFileMoveFailed(error, source, destination):
            return "将下载的文件从 \(source)移动到\(destination)失败: \(error.message())"
        case let .sessionTaskFailed(error):
            return "会话任务失败: \(error.message())"
        }
    }
}

public extension AFError.ParameterEncodingFailureReason {
    var zhDescription: String {
        switch self {
        case .missingURL:
            return "用于编码的URL请求缺少URL"
        case let .jsonEncodingFailed(error):
            return "未能对JSON进行编码:\n\(error.message())"
        case let .customEncodingFailed(error):
            return "自定义参数编码失败: \(error.message())"
        }
    }
}

extension AFError.ParameterEncoderFailureReason {
    var zhDescription: String {
        switch self {
        case let .missingRequiredComponent(component):
            return "缺少请求组件，编码失败: \(component)"
        case let .encoderFailed(error):
            return "基础编码错误: \(error.message())"
        }
    }
}

public extension AFError.MultipartEncodingFailureReason {
    var zhDescription: String {
        switch self {
        case .bodyPartURLInvalid:
            return "提供的URL不是文件URL"
        case .bodyPartFilenameInvalid:
            return "提供的URL没有有效的文件名"
        case .bodyPartFileNotReachable:
            return "无法访问提供的URL"
        case .bodyPartFileNotReachableWithError:
            return "系统在检查提供的URL时返回错误"
        case .bodyPartFileIsDirectory:
            return "提供的URL是一个目录"
        case .bodyPartFileSizeNotAvailable:
            return "无法从提供的URL提取文件大小"
        case .bodyPartFileSizeQueryFailedWithError:
            return "系统返回错误"
        case .bodyPartInputStreamCreationFailed:
            return "未能为提供的URL创建输入流"
        case .outputStreamCreationFailed:
            return "未能为URL创建Outputstream"
        case .outputStreamFileAlreadyExists:
            return "提供的URL中已存在文件"
        case .outputStreamURLInvalid:
            return "提供的输出流URL无效"
        case .outputStreamWriteFailed:
            return "OutputStream写入失败"
        case .inputStreamReadFailed:
            return "输入流读取失败"
        }
    }
}

public extension AFError.ResponseSerializationFailureReason {
    var zhDescription: String {
        switch self {
        case .inputDataNilOrZeroLength:
            return "无法序列化响应，输入数据为零或零长度"
        case .inputFileNil:
            return "无法序列化响应，输入文件为零"
        case .inputFileReadFailed:
            return "无法序列化响应，无法读取输入文件"
        case .stringSerializationFailed:
            return "无法用编码序列化字符串"
        case .jsonSerializationFailed:
            return "未能序列化JSON:返回数据格式错误或长度为零)"
        case let .decodingFailed(error):
            return "无法解码: \(error.message())"
        case let .customSerializationFailed(error):
            return "自定义序列化失败: \(error.message())"
        case let .invalidEmptyResponse(type):
            return "响应为空无法序列化: \(type)"
        }
    }
}

public extension AFError.ResponseValidationFailureReason {
    var zhDescription: String {
        switch self {
        case .dataFileNil:
            return "无法验证响应，数据文件为零"
        case .dataFileReadFailed:
            return "无法验证响应，无法读取数据文件"
        case .missingContentType:
            return (
                "响应内容类型缺失且可接受的内容类型"
            )
        case .unacceptableContentType:
            return (
                "响应内容类型不匹配任何可接受的类型"
            )
        case let .unacceptableStatusCode(code: code):
            return "响应状态代码不可接受: \(code)"
        case let .customValidationFailed(error):
            return "自定义响应验证失败: \(error.message())"
        }
    }
}

extension AFError.ServerTrustFailureReason {
    var zhDescription: String {
        switch self {
        case let .noRequiredEvaluator(host):
            return "服务器未找到信任证书: \(host)"
        case .noCertificatesFound:
            return "找不到证书或没有提供证书"
        case .noPublicKeysFound:
            return "找不到公共密钥或未提供公共密钥"
        case .policyApplicationFailed:
            return "安全策略设置失败。"
        case .settingAnchorCertificatesFailed:
            return "提供的证书设置为anchor证书失败"
        case .revocationPolicyCreationFailed:
            return "创建吊销策略失败"
        case let .trustEvaluationFailed(error):
            return "二级信任评估失败: \(error?.message() ?? "None")"
        case let .defaultEvaluationFailed(output):
            return "主机的默认值失败:\(output.host)."
        case let .hostValidationFailed(output):
            return "主机验证失败:\(output.host)."
        case let .revocationCheckFailed(output, _):
            return "主机的吊销失败: \(output.host)."
        case let .certificatePinningFailed(host, _, _, _):
            return "主机的证书固定失败: \(host)."
        case let .publicKeyPinningFailed(host, _, _, _):
            return "主机的公钥固定失败: \(host)."
        case let .customEvaluationFailed(error):
            return "自定义信任评估失败: \(error.message())"
        }
    }
}

extension AFError.URLRequestValidationFailureReason {
    var zhDescription: String {
        switch self {
        case let .bodyDataInGETRequest(data):
            return """
            请求无效：使用GET方法的请求不能获取body数据:
            \(String(decoding: data, as: UTF8.self))
            """
        }
    }
}
