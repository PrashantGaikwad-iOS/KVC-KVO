//
//  Children.swift
//  KVC KVO
//
//  Created by Prashant G on 11/28/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import Foundation

class Children: NSObject {
    
    // MARK: - Properties
    @objc dynamic var name: String!
    @objc dynamic var age: Int
    
    @objc dynamic var child: Children?
    
    override init() {
        self.name = ""
        self.age = 0
        
        super.init()
    }
    
}
