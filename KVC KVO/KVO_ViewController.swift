//
//  KVO_ViewController.swift
//  KVC KVO
//
//  Created by Prashant G on 11/28/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class KVO_ViewController: UIViewController {

    var child1: Children!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        child1 = Children()
        child1.name = "Suresh"
        child1.age = 50
    }
    
    
    @IBAction func changePropertiesValues(_ sender: Any) {
        child1.name = "Rakesh"
        child1.age = 55
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.child1.addObserver(self, forKeyPath: "name", options: [.old,.new], context: nil)
        self.child1.addObserver(self, forKeyPath: "age", options: [.old,.new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "name" {
            print("Child1 name is changed")
            let newVal = change![NSKeyValueChangeKey.newKey] as! String
            let oldVal = change![NSKeyValueChangeKey.oldKey] as! String
            print("New val is \(newVal) old val is \(oldVal)")
        }else if keyPath == "age" {
            print("Child1 age is changed")
            let newVal = change![NSKeyValueChangeKey.newKey] as! Int
            let oldVal = change![NSKeyValueChangeKey.oldKey] as! Int
            print("New val is \(newVal) old val is \(oldVal)")
        }
    }
}
