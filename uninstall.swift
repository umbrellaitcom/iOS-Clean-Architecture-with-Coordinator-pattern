//
//  main.swift
//  InstallVIPTemplate
//
//  Created by Kazachkov Maksim on 29/10/2017.
//  Copyright © 2017 Kazachkov Maksim. All rights reserved.
//

import Foundation

let templateName = "Module VIP.xctemplate"
let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

func printInConsole(_ message:Any){
    print("\n")
    print("************************************")
    print("\(message)")
    print("************************************")
}

func removeTemplate(){

    let fileManager = FileManager.default
    let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    do {
        let path = "\(destinationPath)/\(templateName)"
        if fileManager.fileExists(atPath: path){
            try _ = fileManager.removeItem(atPath: "\(destinationPath)/\(templateName)")
            printInConsole("✅ Xcode🔨 template uninstalled succesfully 👌🏻.")
        }
        else {
            printInConsole("❌  Xcode🔨 template does not exist at \(path).")
        }
        
    }
    catch let error as NSError {
        printInConsole("❌  Ooops! Something went wrong 🔥😡 : \(error.localizedFailureReason!)")
    }
}

func shell(launchPath: String, arguments: [String]) -> String
{
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.characters.count > 0 {
        //remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

removeTemplate()
