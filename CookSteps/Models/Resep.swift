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
    var gambar: String = String()
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
        Resep(judulResep: "Capjay", bahan: ["Wortel", "Udang", "Jagung", "Bawang"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Seblak Macaroni", bahan: ["Macaroni", "Sosis", "Telur", "Kerupuk Bawang"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Tumis Jamur Tiram", bahan: ["Jamur Tiram", "Tempe", "Cabai", "Saus Tiram"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isCooked: true),
        Resep(judulResep: "Oseng", bahan: ["Kacang Panjang", "Tempe", "Bawang", "Cabai"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isRecomended: true),
        Resep(judulResep: "Sup Kimlo Bakso", bahan: ["Bakso", "Jamur Kuping", "Soun", "Wortel"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Telur Asam Manis", bahan: ["Telur", "Terigu", "Garam", "Wortel"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true, isCooked: true, isRecomended: true),
        Resep(judulResep: "Kangkung Telur", bahan: ["Kangkung", "Telur Puyuh", "Tauco", "Bawang"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true),
        Resep(judulResep: "Soun Goreng", bahan: ["Soun", "Ayam", "Wortel", "Telur"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isCooked: true, isRecomended: true),
        Resep(judulResep: "Mie Goreng Bakso", gambar: "mie.goreng.bakso" ,bahan: ["Mie", "Bakso", "Telur", "Bawang"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Tumis Buncis Ati", bahan: ["Buncis", "Jagung Muda", "Ati", "Tomat"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"], isFavorite: true, isCooked: true),
        Resep(judulResep: "Nasi Goreng Sapi", bahan: ["Nasi", "Daging Sapi", "Daun Jeruk", "Kecap"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"]),
        Resep(judulResep: "Cah Kailan", bahan: ["Kailan", "Bawang", "Maizena", "Gula"], alat: ["Penggorengan", "Pisau", "Spatula"], instruksi: ["Memanaskan minyak", "Tumis bumbu", "Memasak telur", "Memasak ayam", "Memasak nasi"])
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
