//
//  Networkable.swift
//  WareHouseTMS-Swift
//
//  Created by wlyd on 2019/9/2.
//  Copyright © 2019 wlyd-jiangjianli. All rights reserved.
//
import Foundation
import Moya


typealias CompletionB<T:Codable> = (Results<T>?, Error?) -> ()

protocol Networkable {
    
     associatedtype T: Codable
    
    /// 登录
    ///
    /// - Parameters:
    
    func login(account:String, password:String, completion: @escaping CompletionB<T>)
    
    
    /// 获取验证码
    ///
   
    func getVerCode(phone:String, completion: @escaping CompletionB<T>)
    
    
   
}

