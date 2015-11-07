//
//  ViewController.swift
//  Bitrise-GUI-OSX
//
//  Created by Viktor Benei on 07/11/15.
//  Copyright © 2015 bitrise. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let bitriseCLI = BitriseCLI()
//        bitriseCLI.version()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func printBitriseVersion(sender: AnyObject) {
        let bitriseCLI = BitriseCLI()
        NSLog(bitriseCLI.exec(["hi"]))
    }
}

