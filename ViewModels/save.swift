////
////  save.swift
////  ViewModels
////
////  Created by Nguyen Quang Huy on 19/4/2022.
////
//
//import Foundation
//
//let encoder = PropertyListEncoder()
//guard let data: Data = try? encoder.encode(person) else {
//    fatalError("Unable to encode")
//}
//
//// create filePath which is a string
//guard let filePath: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.plist", isDirectory: false) else {
//    fatalError("Unable to fetch user document directory")
//}
//
//// encode and then write to filePath
//let encoder = JSONEncoder()
//guard let data: Data = try? encoder.encode(person) else {
//    fatalError("Unable to encode")
//}
//guard let _ = try? data.write(to: filePath) else {
//    fatalError("Unable to write file to \(filePath.path)")
//}
//
//// decode and then store data in readData?
//let decoder = JSONDecoder()
//guard let readData: Data = try? Data(contentsOf: filePath) else {
//    fatalError("Unable to read file \(filePath.path)")
//}
//
//guard let readPerson: Person = try? decoder.decode(Person.self, from: readData) else {
//    fatalError("Unable to decode file \(filePath.path)")
//}
//
//// loading screen: progressView()
//
