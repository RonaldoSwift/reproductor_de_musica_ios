//
//  MusicaCoreDataSource.swift
//  reproductor_de_musica_ios
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 19/10/22.
//

import Foundation
import CoreData

struct MusicaCoreDataSource {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "reproductor_de_musica_ios")
        self.persistentContainer.loadPersistentStores { (description: NSPersistentStoreDescription,error: Error?) in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }
    
    func getAll() throws -> [MusicaModelo] {
        let request = MusicaEntity.fetchRequest()
        return try persistentContainer.viewContext.fetch(request).map({ (musicaEntity: MusicaEntity) in
            MusicaModelo(
                id: musicaEntity.id!,
                image: musicaEntity.imagen!,
                titulo: musicaEntity.titulo!,
                subTitulo: musicaEntity.subTitulo!,
                love: musicaEntity.love!,
                puntos: musicaEntity.puntos!
            )
        })
    }
    
    
    func getById(_ id: UUID) throws -> MusicaModelo? {
        let musicaEntity = try getEntityById(id)!
        return MusicaModelo(
            id: musicaEntity.id!,
            image: musicaEntity.imagen!,
            titulo: musicaEntity.titulo!,
            subTitulo: musicaEntity.subTitulo!,
            love: musicaEntity.love!,
            puntos: musicaEntity.puntos!
        )

    }
    
    func delete(_ id: UUID) throws -> () {
        let musicaEntity = try getEntityById(id)!
        let context = persistentContainer.viewContext
        context.delete(musicaEntity)
        do {
            try context.save()
        } catch {
            context.rollback()
            fatalError("Error: \(error.localizedDescription)")
        }
    }
    
    
    func update(id: UUID, musicaModelo: MusicaModelo) throws -> () {
        let musicaEntity = try getEntityById(id)!
        musicaEntity.titulo = musicaModelo.titulo
        musicaEntity.subTitulo = musicaModelo.subTitulo
        saveContext()
    }
    
    func create(musicaModelo: MusicaModelo) throws -> () {
        let musicaEntity = MusicaEntity(context: persistentContainer.viewContext)
        musicaEntity.id = musicaModelo.id
        musicaEntity.imagen = musicaModelo.image
        musicaEntity.love = musicaModelo.love
        musicaEntity.puntos = musicaModelo.puntos
        musicaEntity.subTitulo = musicaModelo.subTitulo
        musicaEntity.titulo = musicaModelo.titulo
        saveContext()
    }
    
    private func getEntityById(_ id: UUID) throws -> MusicaEntity? {
        let request = MusicaEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id.uuidString)
        let context = persistentContainer.viewContext
        let musicaEntity = try context.fetch(request)[0]
        return musicaEntity
    }
    
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
