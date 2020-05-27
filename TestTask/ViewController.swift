//
//  ViewController.swift
//  TestTask
//
//  Created by Sergey Vorobey on 27/05/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var login: UILabel!

    private var userData = [Profile]()
    
    private func getData() {
        let dataLoader = LoaderData()
        dataLoader.completionHandler {[weak self] (data, status, _) in
            if status {
                guard let self = self else {return}
                guard let _data = data else {return}
                self.userData = _data
                
                for user in self.userData {
                    
                    self.id.text = "ID: \(user.id)"
                    self.login.text = "LOGIN: \(user.login)"
                    
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getData()
        
    }
}
