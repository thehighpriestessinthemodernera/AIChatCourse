//
//  Color+EXT.swift
//  AIChatCourse
//
//  Created by Intuin  on 21/5/2025.
//

import SwiftUI
import UIKit

extension Color {
    /// Initializes a SwiftUI Color from a hex string like "#RRGGBB"
    init?(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        guard hexFormatted.count == 6,
              let rgbValue = UInt64(hexFormatted, radix: 16) else {
            return nil
        }

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }

    /// Converts the Color to a hex string (e.g., "#FF0000")
    func toHex() -> String? {
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        let reda = Int(red * 255)
        let greena = Int(green * 255)
        let bluea = Int(blue * 255)

        return String(format: "#%02X%02X%02X", reda, greena, bluea)
    }
}
