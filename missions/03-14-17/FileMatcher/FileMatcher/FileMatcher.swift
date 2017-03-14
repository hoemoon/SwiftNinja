//
//  FileMatcher.swift
//  FileMatcher
//
//  Created by hoemoon on 14/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class FileMatcher {
    let filemanager:FileManager = FileManager()
    
    func rawAllFiles(atPath: String) -> [URL] {
        let url = URL(fileURLWithPath: atPath)
        var resultArray = [URL]()
        do {
            resultArray = try filemanager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return resultArray
    }
    // 모든 파일 목록 구하기
    func allFiles(atPath: String) -> [String] {
        return self.rawAllFiles(atPath: atPath).filter { $0.hasDirectoryPath == false }.map { String(describing: $0.lastPathComponent) }
    }
    // 해당 파일 있는지 확인
    func isExist(filename: String, atPath: String) -> Bool {
        let filtered = self.allFiles(atPath: atPath).filter { $0 == filename }
        return filtered.count != 0
    }
    // 찾아야 하는 파일이 여러 개라면?
    func isExist(filename: [String], atPath: String) -> Bool {
        var tempCount = 0
        for name in filename {
            let tempArray = self.allFiles(atPath: atPath).filter { $0 == name }
            if tempArray.count != 0 {
                tempCount += 1
            }
        }
        return tempCount == filename.count
    }
    // 파일명 순서대로 정렬을 하려면?
    func sortedFiles(atPath: String) -> [String] {
        return self.allFiles(atPath: atPath).sorted { $1 > $0 }
    }
    // 특정 확장자 파일 목록 구하기
    func searchByExtension(extensionName: String, atPath: String) -> [String] {
        return self.rawAllFiles(atPath: atPath).filter { $0.pathExtension == extensionName }.map { String(describing: $0.lastPathComponent) }
    }
}
