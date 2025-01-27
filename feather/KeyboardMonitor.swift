//
//  KeyboardMonitor.swift
//  feather
//
//  Created by Osivwi Eric Okiti on 22/01/2025.
//

import Cocoa

class KeyboardMonitor {
    static let shared = KeyboardMonitor()
    
    // Define rows based on AppleScript keycodes for the Mac keyboard
    private let keycodeToRow: [Int: Int] = [
        // First row (numbers and symbols)
        50: 0,  // ` (backtick)
        18: 0,  // 1
        19: 0,  // 2
        20: 0,  // 3
        21: 0,  // 4
        23: 0,  // 5
        22: 0,  // 6
        26: 0,  // 7
        28: 0,  // 8
        25: 0,  // 9
        29: 0,  // 0
        27: 0,  // - (minus)
        24: 0,  // = (equals)
        
        // Second row (QWERTYUIOP and punctuation)
        12: 1,  // Q
        13: 1,  // W
        14: 1,  // E
        15: 1,  // R
        17: 1,  // T
        16: 1,  // Y
        32: 1,  // U
        34: 1,  // I
        31: 1,  // O
        35: 1,  // P
        33: 1,  // [ (left bracket)
        30: 1,  // ] (right bracket)
        39: 1,  // \ (backslash)
        
        // Third row (ASDFGHJKL and punctuation)
        0: 2,   // A
        1: 2,   // S
        2: 2,   // D
        3: 2,   // F
        5: 2,   // G
        4: 2,   // H
        38: 2,  // J Jj
        40: 2,   // K k
        8: 2,   // L
        43: 2,  // ; (semicolon)
        41: 2,  // ' (apostrophe)
        
        // Fourth row (ZXCVBNM and punctuation)
        6: 3,   // Z
        7: 3,   // X
        10: 3,  // C
        9: 3,   // V
        11: 3,  // B
        45: 3,  // N
        36: 3,  // M
        44: 3,  // , (comma)
        46: 3,  // . (period)
        47: 3,  // / (slash)
        
        // Spacebar
        49: 3,  // Spacebar
        
        // Delete key
        51: -1,  // Delete key (modifier or non-row key)
    ]
    
    func getRow(for keycode: Int) -> Int? {
        return keycodeToRow[keycode]
    }
    
    func startMonitoring() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            self.handleKeyEvent(event)
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .keyUp) { event in
            self.handleKeyUp(event)
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) { event in
            self.handleModifiers(event)
        }
    }
    
    private func handleKeyEvent(_ event: NSEvent) {
        if !event.isARepeat {
            let keyType = determineKeyType(event.keyCode)
            let row = self.getRow(for: Int(event.keyCode)) ?? 0
            let x = keyType == "GENERIC" ? "\(keyType)_R\(row)" : keyType
            SoundManager.shared.playSound(action: "press", key: x)
        }
    }
    
    
    private func handleKeyUp(_ event: NSEvent) {
        if !event.isARepeat {
            let keyType = determineKeyType(event.keyCode)
            let x = keyType != "GENERIC" ? "\(keyType)_RELEASE" : keyType
            SoundManager.shared.playSound(action: "release", key: x)
        }
    }
    
    private func handleModifiers(_ event: NSEvent) {
        let x = "GENERIC_R4"
        SoundManager.shared.playSound(action: "release", key: x)
        
    }
    
    private func determineKeyType(_ keyCode: UInt16) -> String {
        switch keyCode {
        case 36:  // Enter
            return "ENTER"
        case 49:  // Space
            return "SPACE"
        case 51:  // Backspace
            return "BACKSPACE"
        default:  // Generic keys
            return "GENERIC"
        }
    }
}
