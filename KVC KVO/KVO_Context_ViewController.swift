//
//  KVO_Context_ViewController.swift
//  KVC KVO
//
//  Created by Prashant G on 11/28/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

// context is to uniquely identify a change on a property
let contextChild1 = UnsafeMutableRawPointer.allocate(byteCount: 4 * 4, alignment: 1)
let contextChild2 = UnsafeMutableRawPointer.allocate(byteCount: 4 * 4, alignment: 2)

class KVO_Context_ViewController: UIViewController {

    var child1: Children!
    var child2: Children!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        child1 = Children()
        child2 = Children()
     }
    
    @IBAction func changePropertiesValues(_ sender: Any) {
        
        self.child1.addObserver(self, forKeyPath: "age", options: [.old,.new], context: contextChild1)
        self.child2.addObserver(self, forKeyPath: "age", options: [.old,.new], context: contextChild2)
        
        self.child1.age = 24
        
        self.child2.age = 34
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == contextChild1 {
            if keyPath == "age" {
                let newVal = change![NSKeyValueChangeKey.newKey] as! Int
                let oldVal = change![NSKeyValueChangeKey.oldKey] as! Int
                print("Child 1 = New val is \(newVal) old val is \(oldVal)")
            }
        }
        
        if context == contextChild2 {
            if keyPath == "age" {
                let newVal = change![NSKeyValueChangeKey.newKey] as! Int
                let oldVal = change![NSKeyValueChangeKey.oldKey] as! Int
                print("Child 2 = New val is \(newVal) old val is \(oldVal)")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.child1.removeObserver(self, forKeyPath: "age", context: contextChild1)
        self.child2.removeObserver(self, forKeyPath: "age", context: contextChild2)
    }
    

}
