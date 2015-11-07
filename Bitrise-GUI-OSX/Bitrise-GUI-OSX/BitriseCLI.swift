//
//  BitriseCLI.swift
//  Bitrise-GUI-OSX
//
//  Created by Viktor Benei on 07/11/15.
//  Copyright © 2015 bitrise. All rights reserved.
//

import Foundation

class BitriseCLI {
    
    func bitriseBinLocation() -> String {
        let binLoc = NSBundle.mainBundle().pathForResource("bitrise", ofType: "")
        return binLoc!
    }
    
    func version() -> String {
        let output = self.exec(["--version"])
        
        NSLog("output: \(output)")
        return output
    }
    
    
    func exec(args: [String]?) -> (String) {
        let task = NSTask()
        task.launchPath = bitriseBinLocation()
        task.arguments = args
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: NSUTF8StringEncoding)!
        return output
    }
}