//
//  BitriseCLI.swift
//  Bitrise-GUI-OSX
//
//  Created by Viktor Benei on 07/11/15.
//  Copyright © 2015 bitrise. All rights reserved.
//

import Foundation

enum BitriseCLIErrors: ErrorType {
    case InvalidResponse
}

class BitriseCLI {
    
    func bitriseBinLocation() -> String {
        let binLoc = NSBundle.mainBundle().pathForResource("bitrise", ofType: "")
        return binLoc!
    }
    
    func version() -> String? {
        let outputData = self.exec(["version", "--format=json"])
        
        do {
            if let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(outputData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                if let verStr = json["version"] as? String {
                    return verStr
                }
            }
        } catch {
            print(" [!] Failed to get version - invalid JSON response")
        }

        
        return nil
    }
    
    func convertOutputDataToString(outputData: NSData) -> String {
        return String(data: outputData, encoding: NSUTF8StringEncoding)!
    }
    
    func exec(args: [String]?) -> NSData {
        let task = NSTask()
        task.launchPath = bitriseBinLocation()
        task.arguments = args
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return data
    }
}