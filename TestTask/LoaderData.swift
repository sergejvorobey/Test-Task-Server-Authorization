//
//  LoaderData.swift
//  TestTask
//
//  Created by Sergey Vorobey on 27/05/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class LoaderData {
    
    fileprivate let userAuth = UserAuth().params
    fileprivate let baseUrl = "http://37.140.199.187:3000/auth/login"
    typealias callBackUser = (_ countries:[Profile]?, _ status: Bool, _ message: String) -> Void
    var callBack: callBackUser?
    
    init() {
        postData()
    }
    
    private func postData() {
        
        AF.request(baseUrl, method: .post, parameters: userAuth, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                guard let user = Profile(json: value as! [String : Any]) else {return}
                self.callBack?([user], true,"Data uploaded")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping callBackUser) {
        self.callBack = callBack
    }
}



