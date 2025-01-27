//
//  SoundManager.swift
//  feather
//
//  Created by Osivwi Eric Okiti on 22/01/2025.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var players: [String: [String: AVAudioPlayer]] = ["press": [:], "release": [:]]
    private let actions = ["press", "release"]
    
    func loadSounds(for selectedProfile: String) {
        let soundKeys = ["backspace", "backspace_release", "space", "space_release", "enter", "enter_release", "generic", "generic_R0", "generic_R1", "generic_R2", "generic_R3", "generic_R4"]
        
        for action in actions {
            for key in soundKeys {
                let pathName = "\(key.uppercased())"
                if let soundURL = Bundle.main.url(forResource: pathName, withExtension: "mp3") {
                    do {
                        let player = try AVAudioPlayer(contentsOf: soundURL)
                        player.prepareToPlay()
                        players[action]?[key.uppercased()] = player
                    } catch {
                        print("Error loading \(action) sound for \(key): \(error)")
                    }
                } else {
                    print("Cant find ben \(pathName).mp3")
                }
            }
        }
    }
    
    
    func playSound(action: String, key: String) {
        guard let soundPlayer = players[action]?[key] else { return }
        
        if !soundPlayer.isPlaying {
            soundPlayer.play()
        }
    }
    
    func updateVolume(_ volume: Float) {
        for (_, soundPlayers) in players {
            for player in soundPlayers.values {
                player.volume = volume
            }
        }
    }

    func muteVolume() {
        for (_, soundPlayers) in players {
            for player in soundPlayers.values {
                player.volume = 0
            }
        }
    }
}

