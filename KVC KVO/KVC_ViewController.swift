//
//  ViewController.swift
//  KVC KVO
//
//  Created by Prashant G on 11/28/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class KVC_ViewController: UIViewController {

    // MARK: - Properties
    var child1: Children!
    var child2: Children!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Normal way
        self.child1 = Children()
        self.child1.name = "Prashant"
        self.child1.age = 26
        print("My Name is = \(self.child1.name ?? "Empty") and My Age is \(self.child1.age)")
        
        // KVC method with KEYS
        self.child1.setValue("Prashant G", forKey: "name")
        self.child1.setValue(26, forKey: "age")
        var fullName = self.child1.value(forKey: "name")
        var age = self.child1.value(forKey: "age")
        print("My Name is = \(fullName ?? "Empty") and My Age is \(age ?? 0)")
        
        // KVC with KEY PATHS
        self.child2 = Children.init()
        self.child2.child = Children.init()
        
        self.child2.setValue("Prakash", forKey: "name")
        self.child2.setValue(22, forKey: "age")
        print("My Name is = \(self.child2.name ?? "Empty") and My Age is \(self.child2.age)")
        
        self.child2.setValue("Vijay", forKeyPath: "child.name")
        self.child2.setValue(20, forKeyPath: "child.age")
        fullName = self.child2.child?.value(forKeyPath: "name")
        age = self.child2.child?.value(forKeyPath: "age")
        print("My Name is = \(fullName ?? "Empty") and My Age is \(age ?? 0)")
        
        
        
    }


}

