//
//  MusicaDetalleViewModel.swift
//  reproductor_de_musica_ios
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 5/09/22.
//

import AVFoundation

class MusicaDetallViewModel {
    
    // Read this https://www.globalnerdy.com/2015/07/06/how-to-fix-the-common-no-sound-from-avplayer-avaudioplayer-problem-in-ios-swift-programming/ to understand why to declare avPlayer here and not inside a method
    var avPlayer: AVPlayer!
    
    var isPlaying: Bool {
        return avPlayer.rate != 0
    }
    
    func playMusic() {
        let url1 = URL(string: "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3")
        let url2 = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
        let playerItem: AVPlayerItem = AVPlayerItem(url: url2!)
        avPlayer = AVPlayer(playerItem: playerItem)
        avPlayer.play()
    }
    
    func pauseMusic() {
        guard isPlaying else {
            return print("Attempting to pause while not playing.")
        }
        avPlayer.pause()
    }
    
}
