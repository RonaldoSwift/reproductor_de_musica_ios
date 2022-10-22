//
//  MusicaDetalleViewModel.swift
//  reproductor_de_musica_ios
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 5/09/22.
//

import AVFoundation

class MusicaDetallViewModel {
    
    
    var musicaRepsitory: MusicaRepository = MusicaRepository(dataSource: MusicaCoreDataSource())
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
    
    func guardarEnBaseDeDatos() async {
        let musicaModelo = MusicaModelo(id: UUID(), image: "carlos", titulo: "carlos", subTitulo: "carlos", love: "no", puntos: "100")
        let result = await musicaRepsitory.createMusica(musicaModelo)
        switch result {
        case .success(let wasCreated):
            print("EL USUARIO FUE CREADO \(wasCreated)")
        case .failure(let musicaError):
            print("HUBO UN ERROR AL INTENTAR GUARDAR \(musicaError.localizedDescription)")
        }
    }
    
    func obtenerUsuariosDeBaseDeDatos() async {
        let result = await musicaRepsitory.getMusicas()
        switch result {
        case .success(let musicaModelos):
            print("SE ENCONTRO \(musicaModelos.count)")
        case .failure(let musicaError):
            print("HUBO UN ERROR AL INTENTAR LEER \(musicaError.localizedDescription)")
        }
    }
    
}
