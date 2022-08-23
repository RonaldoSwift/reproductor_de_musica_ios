//
//  NewReleaseView.swift
//  reproductor_de_musica_ios
//
//  Created by Ronaldo Andre Vargas Huaman on 22/08/22.
//

import SwiftUI

struct NewReleaseView: View {
    
    var musicaModelos: [MusicaModelo] = [MusicaModelo.init(id: 0,
                                                           image: "MotherSong",
                                                           titulo: "Mother Song",
                                                           subTitulo: "VALIMAI",
                                                           love: "heart.fill",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 1,
                                                           image: "SoBaby",
                                                           titulo: "So Baby",
                                                           subTitulo: "DOCTER",
                                                           love: "heart.fill",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 2,
                                                           image: "Mehere",
                                                           titulo: "Meherezylaa",
                                                           subTitulo: "MAANAADU",
                                                           love: "heart",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 3,
                                                           image: "Adipoli",
                                                           titulo: "Adipoli",
                                                           subTitulo: "ALBUM",
                                                           love: "heart",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 4,
                                                           image: "Tum",
                                                           titulo: "Tum Tum",
                                                           subTitulo: "ENEMY",
                                                           love: "heart",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 5,
                                                           image: "Jala",
                                                           titulo: "Jalabulajangu",
                                                           subTitulo: "DON",
                                                           love: "heart",
                                                           puntos: "TresPuntos"),
                                         MusicaModelo.init(id: 6,
                                                           image: "Solriya",
                                                           titulo: "Oo Solriya Oo Oo",
                                                           subTitulo: "PUSHPA",
                                                           love: "heart",
                                                           puntos: "TresPuntos")
    ]
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Image("Option")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26, alignment: .center)
                }
                Spacer()
                
                Text("New Release")
                Text("ALBUM")
                ScrollView{
                    ForEach( musicaModelos, id: \.id) { musicaModelo in
                        PrimerScroll(image: musicaModelo.image,
                                     titulo: musicaModelo.titulo,
                                     subTitulo: musicaModelo.subTitulo,
                                     love: musicaModelo.love,
                                     puntos: musicaModelo.puntos)
                    }
                }
            }
            .padding()
            
            ZStack{
                HStack{
                    Image("MotherSong")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58, alignment: .center)
                        .cornerRadius(10)
                    VStack(alignment: .leading){
                        Text("Mother Song")
                        Text("VALIMAI")
                    }
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 39, height: 39)
                        .padding(EdgeInsets.init(top: 0, leading: 150, bottom: 0, trailing: 0))
                }
                .foregroundColor(Color.white)
            }
            .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.black)
            .frame(width: 420, height: 100, alignment: .center)
            
        }
    }
    
    public func PrimerScroll(image: String, titulo: String, subTitulo: String, love: String, puntos: String) -> some View{
        return HStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58, alignment: .center)
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text(titulo)
                Text(subTitulo)
            }
            
            Spacer()
            
            Image(systemName: love)
                .resizable()
                .scaledToFit()
                .frame(width: 23, height: 20, alignment: .center)
            Image(puntos)
                .resizable()
                .scaledToFit()
                .frame(width: 23, height: 20, alignment: .center)
                .padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 0))
        }
        .padding(EdgeInsets.init(top: 0, leading: 29, bottom: 33, trailing: 15))
    }
    
    
}

struct NewReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        NewReleaseView()
    }
}
