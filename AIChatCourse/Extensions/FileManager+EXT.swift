//
//  FileManager+EXT.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/10/2025.
//

import Foundation

extension FileManager {
    
    static func saveDocument<T: Codable>(key: String, value: T?) throws {
        let data = try JSONEncoder().encode(value)
        let url = try getDocumentURL(for: key)
        try data.write(to: url)
    }
    
    static func getDocument<T: Codable>(key: String) throws -> T? {
        let url = try getDocumentURL(for: key)
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
    private static func getDocumentURL(for key: String) throws -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("\(key).txt")
    }
}
