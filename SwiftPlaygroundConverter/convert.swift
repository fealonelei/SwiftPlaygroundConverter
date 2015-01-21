//
//  convert.swift
//  SwiftPlaygroundConvert
//
//  Created by WebosterBob on 1/10/15.
//  Copyright (c) 2015 ___SLIGHTECH___. All rights reserved.
//

import Foundation
import Appkit

class File {
    
    class func exists(path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
    
    class func read(path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if File.exists(path) {
            return String(contentsOfFile: path, encoding: encoding, error: nil)!
        }
        
        return nil
    }
    
    class func write(path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        return content.writeToFile(path, atomically: true, encoding: encoding, error: nil)
    }
}

let read : String? = File.read("/path/to/file.txt")

//println(read)

let write : Bool = File.write("/path/to/file2.txt", content: "String to write")

//println(write)
