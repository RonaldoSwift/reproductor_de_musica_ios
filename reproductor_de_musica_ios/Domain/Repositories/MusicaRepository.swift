//
//  MusicaRepository.swift
//  reproductor_de_musica_ios
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 19/10/22.
//

import Foundation

struct MusicaRepository {
    
    
    var dataSource: MusicaCoreDataSource
    
    func getMusica(id: UUID) async -> Result<MusicaModelo?, MusicaError> {
        
        do {
            let _musicaModel = try await dataSource.getById(id)
            return .success(_musicaModel)
        } catch {
            return .failure(.FetchError)
        }
    }
    
    func deleteMusica(_ id: UUID) async -> Result<Bool, MusicaError> {
        do {
            try await dataSource.delete(id)
            return .success(true)
        } catch {
            return .failure(.DeleteError)
        }
    }
    
    func createMusica(_ musicaModelo: MusicaModelo) async -> Result<Bool, MusicaError> {
        do {
            try await dataSource.create(musicaModelo: musicaModelo)
            return .success(true)
        } catch {
            return .failure(.CreateError)
        }
    }
    
    func updateMusica(_ musicaModelo: MusicaModelo) async -> Result<Bool, MusicaError> {
        do {
            try await dataSource.update(id: musicaModelo.id, musicaModelo: musicaModelo)
            return .success(true)
        } catch {
            return .failure(.UpdateError)
        }
    }
    
    func getMusicas() async -> Result<[MusicaModelo], MusicaError> {
        do {
            let _musicaModelos = try await dataSource.getAll()
            return .success(_musicaModelos)
        } catch {
            return .failure(.FetchError)
        }
    }
    
}
