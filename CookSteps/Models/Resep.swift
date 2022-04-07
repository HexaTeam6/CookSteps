//
//  Resep.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 06/04/22.
//

import Foundation

struct Resep: Identifiable{
    var id: String = UUID().uuidString
    var judulResep: String
    var bahan: [String]
    var alat: [String]
    var instruksi: [String]
    var isFavorite: Bool = false
    var isCooked: Bool = false
    var isRecomended: Bool = false
}

extension Array where Element == Resep {
    func indexOfReminder(with id: Resep.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        
        return index
    }
}


#if DEBUG
extension Resep{
    static var sampleData = [
        Resep(judulResep: "Nasi Goreng 1", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Nasi Goreng 2", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Nasi Goreng 3", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isCooked: true),
        Resep(judulResep: "Nasi Goreng 4", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isRecomended: true),
        Resep(judulResep: "Nasi Goreng 5", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Nasi Goreng 6", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true, isCooked: true, isRecomended: true),
        Resep(judulResep: "Nasi Goreng 7", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Nasi Goreng 8", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isCooked: true, isRecomended: true),
        Resep(judulResep: "Nasi Goreng 9", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Nasi Goreng 10", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true, isCooked: true),
        Resep(judulResep: "Nasi Goreng 11", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Nasi Goreng 12", bahan: ["Nasi", "Kerupuk", "Telur", "Timun"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"])
    ]
    
    static func favorite() -> [Resep] {
        let data: [Resep] = Resep.sampleData
        let filteredArray = data.filter {
            $0.isFavorite == true
        }
        
        return filteredArray
    }
    
    static func cooked() -> [Resep] {
        let data: [Resep] = Resep.sampleData
        let filteredArray = data.filter {
            $0.isCooked == true
        }
        
        return filteredArray
    }
    
    static func recomended() -> [Resep] {
        let data: [Resep] = Resep.sampleData
        let filteredArray = data.filter {
            $0.isRecomended == true
        }
        
        return filteredArray
    }
}
#endif
