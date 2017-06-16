//
//  Tools.swift
//  Tools
//
//  Created by Kagen Zhao on 2017/6/16.
//  Copyright © 2017年 Kagen Zhao. All rights reserved.
//
import Foundation
import Cocoa

let tool = Tools()
tool.staticMode()
class Tools {
    func staticMode() {
        var inputDir = CommandLine.arguments[0]
        var outputFile = ""
        func setOption(option: (OptionType, String, String?)) {
            switch option.0 {
            case .input:
                if let value = option.2 {
                    inputDir = value
                } else {
                    fatalError("not found input file")
                }
            case .output:
                if let value = option.2 {
                    outputFile = value
                } else {
                    fatalError("not found input file")
                }
            case .help:
                print("help")
            case .unknown:
                fatalError("not found argument -- \(option.1)")
            }
        }
        
        for i in stride(from: 1, to: CommandLine.argc - 1, by: 2) {
            let opt = Console.getOptionValue(idx: Int(i))
            setOption(option: opt)
        }
        
        guard outputFile.characters.count > 0 else { fatalError("not found input file") }
        
        let files: [String] = getFiles(path: inputDir)
        guard files.count > 0 else {
            print("not found files from Dir")
            return
        }
        for file in files {
            write(fromFile: file, to: outputFile)
        }
    }
    
    func write(fromFile: String, to file: String) {
        let fileManager = FileManager()
        guard fileManager.fileExists(atPath: fromFile) else { fatalError("wrong path") }
        guard fileManager.fileExists(atPath: file) else { fatalError("wrong path") }
        
        var str = "// 这是写入的数据, 请不要修改!!!!\n"
        str += "import Cocoa\n"
        str += "class Test {\n"
        str += "    func testFunction() {\n"
        str += "        print(\"写入数据\")"
        str += "    }\n"
        str += "}\n"
        let data = str.data(using: .utf8)!
        do {
            try data.write(to: URL(string: "file://" + file)!)
        } catch {
            fatalError("\(error)")
        }
    }
    
    func getFiles(path: String) -> [String] {
        let fileManager = FileManager()
        guard fileManager.fileExists(atPath: path) else { fatalError("wrong path") }
        guard let subPath = fileManager.subpaths(atPath: path) else { fatalError("no sub path") }
        return subPath.filter({ !$0.hasPrefix(".") && $0.hasSuffix(".swift") }).map({ path + "/" + $0 })
    }
}

enum OptionType: String {
    case input = "-i"
    case output = "-o"
    case help = "-h"
    case unknown
    
    init(value: String) {
        if let v = OptionType(rawValue: value) {
            self = v
        } else {
            self = .unknown
        }
    }
}

class Console {
    static func getOptionValue(idx: Int) -> (OptionType, String, String?) {
        if idx < CommandLine.argc {
            let opt = CommandLine.arguments[idx]
            let optional = OptionType(value: opt)
            let value = idx + 1 < CommandLine.argc ? CommandLine.arguments[idx + 1] : nil
            return (optional, opt, value)
        } else {
            return (.unknown, "", nil)
        }
    }
}
