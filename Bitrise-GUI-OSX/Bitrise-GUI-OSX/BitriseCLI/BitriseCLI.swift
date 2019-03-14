//
//  BitriseCLI.swift
//  Bitrise-GUI-OSX
//
//  Created by Viktor Benei on 07/11/15.
//  Copyright © 2015 bitrise. All rights reserved.
//

import Foundation

enum BitriseCLIErrors: Error {
    case InvalidResponse
}

class BitriseCLI {
    
    var bitriseBinLocation: String {
        return  Bundle.main.path(forResource: "bitrise", ofType: "")!
    }
    
    var version: String? {
        let outputData = exec(args: ["version", "--format=json"])
        
        do {
            if let json = try JSONSerialization.jsonObject(with: outputData, options: .mutableContainers) as? [String: Any] {
                if let verStr = json["version"] as? String {
                    return verStr
                }
            }
        } catch {
            print(" [!] Failed to get version - invalid JSON response")
        }

        
        return nil
    }
    
    func convertOutputDataToString(outputData: Data) -> String {
        return String(data: outputData, encoding: .utf8)!
    }
    
    func exec(args: [String]?) -> Data {
        let task = Process()
        task.launchPath = bitriseBinLocation
        task.arguments = args
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return data
    }
}
