//
//  AppDelegate.swift
//  feather
//
//  Created by Osivwi Eric Okiti on 22/01/2025.
//

import Cocoa
import AVFoundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem?

    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.run()
    }

    
    func applicationDidFinishLaunching(_ notification: Notification) {
        requestAccessibilityPermissions()
        setupMenuBar()
        SoundManager.shared.loadSounds(for: "cream")
        SoundManager.shared.updateVolume(0.7)
        KeyboardMonitor.shared.startMonitoring()
    }
}

extension AppDelegate {
    func setupMenuBar() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let favicon = NSImage(named: "favicon"){
            statusItem?.button?.image = favicon
        } else {
            statusItem?.button?.title = "MechKey"
        }
        
        let menu = NSMenu()
        // Volume submenu
        let volumeMenu = NSMenu()
        volumeMenu.addItem(NSMenuItem(title: "100%", action: #selector(setVolume100), keyEquivalent: ""))
        volumeMenu.addItem(NSMenuItem(title: "75%", action: #selector(setVolume75), keyEquivalent: ""))
        volumeMenu.addItem(NSMenuItem(title: "50%", action: #selector(setVolume50), keyEquivalent: ""))
        volumeMenu.addItem(NSMenuItem(title: "25%", action: #selector(setVolume25), keyEquivalent: ""))
        volumeMenu.addItem(NSMenuItem(title: "0%", action: #selector(setVolumeMute), keyEquivalent: ""))

        let volumeMenuItem = NSMenuItem(title: "Volume", action: nil, keyEquivalent: "")
        volumeMenuItem.submenu = volumeMenu
        menu.addItem(volumeMenuItem)
        
        menu.addItem(NSMenuItem(title: "Mute", action: #selector(toggleMute), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        
        let textItem = NSMenuItem(title: "Keys: Creams", action: nil, keyEquivalent: "")
        textItem.isEnabled = false
        menu.addItem(textItem)
        
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem?.menu = menu
    }
    
    // Add these action methods
    @objc func setVolume100() {
        Settings.shared.volume = 1.0
    }
    
    @objc func setVolume75() {
        Settings.shared.volume = 0.75
    }
    
    @objc func setVolume50() {
        Settings.shared.volume = 0.50
    }
    
    @objc func setVolume25() {
        Settings.shared.volume = 0.25
    }
    
    @objc func setVolumeMute() {
        Settings.shared.volume = 0
    }
    
    @objc func toggleMute() {
        Settings.shared.isMuted = !Settings.shared.isMuted
        // Update menu item state
        if let menuItem = statusItem?.menu?.item(withTitle: "Mute") {
            menuItem.state = Settings.shared.isMuted ? .on : .off
        }
        if !Settings.shared.isMuted {
            Settings.shared.volume = 0
        } else {
            Settings.shared.volume = 0.7
        }
    }
}
