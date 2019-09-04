//
//  Networkable.swift
//  WareHouseTMS-Swift
//
//  Created by wlyd on 2019/9/2.
//  Copyright © 2019 wlyd-jiangjianli. All rights reserved.
//


import Moya
import Result





class NetworkManager<T:Codable>: Networkable{
    

    
    func login(account:String, password:String, completion: @escaping CompletionB<T>) {
        
        Provider.request(.login(account: account, password: password)) {
            
            [weak self](response) in
           
            self?.delResponse(response: response, result: completion)
 
        }
    }
    
    
    
    
    func getVerCode(phone: String, completion:  @escaping (Results<T>?, Error?) -> ()) {
        
        Provider.request(.forgetpasswordGetVerCode(phone: phone)) {
            [weak self](response) in
            
            self?.delResponse(response: response, result: completion)
        }
        
    }
    
   
    
    private func delResponse(response: Result<Moya.Response, MoyaError>, result: @escaping CompletionB<T>)
    {
        
        
        switch response.result {

        case .failure(let error):

            result(nil, error)

        case .success(let value):

            let decoder = JSONDecoder()
            do {

                let model = try decoder.decode(Results<T>.self, from: value.data)

                result(model, nil)

            } catch let error {

                result(nil, error)

            }
        }
    }
    
 

}
