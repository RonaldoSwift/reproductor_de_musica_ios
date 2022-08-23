//
//  WelcomePantallaView.swift
//  reproductor_de_musica_ios
//
//  Created by Ronaldo Andre Vargas Huaman on 17/08/22.
//

import SwiftUI

struct WelcomePantallaView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    NavigationLink {
                        NewReleaseView()
                    } label: {
                        ZStack{
                            Image("nube")
                                .resizable()
                                .frame(width: 170, height: 116, alignment: .center)
                        }
                    }
                        
                        HStack{
                            Image("vector")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                            Image("vector")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                        }
                    
                    Text("Cloud")
                        .foregroundColor(Color.white)
                    Text("Music")
                        .foregroundColor(Color.white)
                    
                    HStack{
                        Image("elipse")
                        Image("ellipseDos")
                        Image("ellipseTres")
                    }
                }
            }
            .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.black)
        }
    }
}

struct WelcomePantallaView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePantallaView()
    }
}
