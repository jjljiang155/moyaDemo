//
//  Networkable.swift
//  WareHouseTMS-Swift
//
//  Created by wlyd on 2019/9/2.
//  Copyright © 2019 wlyd-jiangjianli. All rights reserved.
//

import Moya
import Foundation

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

public enum API {
    //登录
    case login(account:String,password:String)
    //忘记密码获取验证码
    case forgetpasswordGetVerCode(phone:String)
    
}




enum APIEnvironments {
    
    case debug,production
}


let Provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])



extension API: TargetType {
    
    var environments:APIEnvironments{
        
        return .debug
    }
    
    var enviromentBaseUrl:String{
        
        
        switch environments {
            
        case .debug:
            
            return ""
            
        case .production:
            
            return ""
        }
        
    }
    
    public var baseURL: URL {
        
        guard let url = (URL(string: enviromentBaseUrl)) else {
           fatalError("url error")
        }
        
        return url
    }
    
    public var path: String {
        
        switch self {
            
      
        case .login:
            
            return ""
            
            
        case .forgetpasswordGetVerCode:
            
            
            return ""
            
     }
        
    }
    public var method: Moya.Method {
        
        switch self {
            
 
        default:
             return .post
        }
        
        
    }
    
    
    
    public var task: Task {
        
        switch self {
            
 
        case let .login(account,password):
            
            return .requestParameters(parameters: ["Moblie" :account,"Password":password], encoding: JSONEncoding.default )
        
           
        case let .forgetpasswordGetVerCode(phone):
            
            return .requestParameters(parameters: ["Moblie" :phone], encoding: JSONEncoding.default)
            
            
        default:
            return .requestPlain

        }
    }
    
    
    
    public var sampleData: Data {
        
            
            return Data()
        
    }
    
    public var headers: [String: String]? {
        
        
        
        return nil
    }
    
    
}

