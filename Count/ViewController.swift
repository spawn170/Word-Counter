//
//  ViewController.swift
//  Count
//
//  Created by Ty Trapps on 9/11/15.
//  Copyright (c) 2015 Ty Trapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CountedString()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func CountedString() {
        
        let stringPath = NSBundle.mainBundle().pathForResource("alice", ofType: "txt")
        let string = String(contentsOfFile: stringPath!, encoding: NSUTF8StringEncoding, error: nil)
        let textRange = string!.startIndex..<string!.endIndex
        let options : NSStringEnumerationOptions = .ByWords | .Localized
        let countedSet = NSCountedSet()
        var dictionary = [String: String]()
        
        string!.enumerateSubstringsInRange(textRange, options: options) { (substring, substringRange, enclosingRange, stop) -> () in
            countedSet.addObject(substring.lowercaseString)
        }
        
        for var i = 0; i < countedSet.allObjects.count; i++ {
            var temp: String = "\(countedSet.countForObject(countedSet.allObjects[i]))"
            dictionary[countedSet.allObjects[i] as String] = temp
        }
        
        NSLog("%@", dictionary)
    }
    
}


