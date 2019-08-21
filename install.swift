//
//  main.swift
//  InstallVIPERTemplate
//
//  Created by Juanpe Catalán on 17/02/2017.
//  Copyright © 2017 Juanpe Catalán. All rights reserved.
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

func moveTemplate(){

    let fileManager = FileManager.default
    let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    do {
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){
        
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            
            printInConsole("✅ Xcode🔨 template installed succesfully 👌🏻. Enjoy it 👨🏻‍💻")
            
        }
        else {
            try _ = fileManager.replaceItemAt(URL(fileURLWithPath:"\(destinationPath)/\(templateName)"), withItemAt: URL(fileURLWithPath:templateName))
            
            printInConsole("✅  Xcode🔨 template already exists. So has been replaced succesfully 👌🏻. Enjoy it 👨🏻‍💻")
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
    var output = String(data: data, encoding: String.Encoding.utf8)!
    if !output.isEmpty {
        //remove newline character.
        output = String(output.dropLast())
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()
