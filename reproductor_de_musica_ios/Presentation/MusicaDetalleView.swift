//
//  MusicaDetalleView.swift
//  reproductor_de_musica_ios
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 5/09/22.
//

import SwiftUI

struct MusicaDetalleView: View {
    
    let musicaModelo: MusicaModelo
    let musicaDetalleViewModel: MusicaDetallViewModel = MusicaDetallViewModel()
    
    var body: some View {
        
        VStack {
            Text("Titulo de musica: \(musicaModelo.titulo)")
            Button("Play") {
                musicaDetalleViewModel.playMusic()
            }
            
            Button("Pause") {
                musicaDetalleViewModel.pauseMusic()
            }
            Button("Guardar en base de datos") {
                Task {
                    await musicaDetalleViewModel.guardarEnBaseDeDatos()
                }
            }
            Button("Obtener musicas desde base de datos") {
                Task {
                    await musicaDetalleViewModel.obtenerUsuariosDeBaseDeDatos()
                }
            }
        }
    
    }
}

struct MusicaDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        MusicaDetalleView(
            musicaModelo: MusicaModelo(id: UUID(), image: "", titulo: "", subTitulo: "", love: "", puntos: "")
        )
    }
}
