//
//  Profile.swift
//  TestTask
//
//  Created by Sergey Vorobey on 27/05/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import Foundation


struct Profile {
    var login: String
    var id: String
    var access_token: String
    
    init?(json: [String: Any]) {

        guard
            let login = json["login"] as? String,
            let id = json["id"] as? String,
            let access_token = json["access_token"] as? String
            else {
                return nil
        }

        self.login = login
        self.id = id
        self.access_token = access_token
    }
}

struct UserAuth {
    var username = "guest"
    var password = "guest"
    var params: [String: Any] {
       return ["username": username, "password": password]
    }
}
