//
//  Settings.swift
//  feather
//
//  Created by Osivwi Eric Okiti on 22/01/2025.
//

import Cocoa
import AVFoundation
import ApplicationServices

import Foundation

class Settings {
    static let shared = Settings()
    
    var volume: Float {
        get { UserDefaults.standard.float(forKey: "volume") }
        set {
            UserDefaults.standard.set(newValue, forKey: "volume")
            updateVolume()
        }
    }
    
    var isMuted: Bool {
        get { UserDefaults.standard.bool(forKey: "isMuted") }
        set { UserDefaults.standard.set(newValue, forKey: "isMuted") }
    }
    
    private func updateVolume() {
        SoundManager.shared.updateVolume(volume)
    }
}

func requestAccessibilityPermissions() {
    let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true]
    let accessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary?)
    
    if !accessEnabled {
        let alert = NSAlert()
        alert.messageText = "Accessibility Permissions Required"
        alert.informativeText = "Please enable accessibility permissions in System Preferences → Security & Privacy → Privacy → Accessibility"
        alert.runModal()
    }
}
