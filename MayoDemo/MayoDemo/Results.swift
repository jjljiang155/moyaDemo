//
//  Networkable.swift
//  WareHouseTMS-Swift
//
//  Created by wlyd on 2019/9/2.
//  Copyright © 2019 wlyd-jiangjianli. All rights reserved.


import Foundation


public typealias Codable = Decodable & Encodable


//
struct Results<T:Codable>: Codable {
    
    var OperationDesc: String
    
    var ResultCode: Int
    
    var IsSuccess: Bool
    
    var Result:T
    
    
}
