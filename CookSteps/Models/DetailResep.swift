//
//  DetailResep.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 10/04/22.
//

import Foundation

struct Options {
    let optionName: String
    let optionDesc: String
    var isChecked: Bool = false
    var isInstruction: Bool = false
}

class DetailResep {
    let section: String
    var options: [Options]
    var isOpened: Bool = true
    
    init(section: String, options: [Options], isOpened: Bool = true) {
        self.section = section
        self.options = options
        self.isOpened = isOpened
    }
}

extension DetailResep {
    static var sampleData = [
        DetailResep(section: "Alat", options: [
            Options(optionName:"Penggorengan", optionDesc: "wajib"),
            Options(optionName:"Pisau", optionDesc: "opsional"),
            Options(optionName:"Spatula", optionDesc: "wajib")
        ]),
        DetailResep(section: "Bahan", options: [
            Options(optionName:"Paha Ayam", optionDesc: "1 potong"),
            Options(optionName:"Telur", optionDesc: "2 butir"),
            Options(optionName:"Udang tanpa kulit", optionDesc: "150 gram"),
            Options(optionName:"Bakso sapi", optionDesc: "5 buah"),
            Options(optionName:"Bakso ikan", optionDesc: "5 buah"),
            Options(optionName:"Nasi putih", optionDesc: "500 gram")
        ]),
        DetailResep(section: "Cara memasak", options: [
            Options(optionName:"Memanaskan minyak", optionDesc: "2 menit", isInstruction: true),
            Options(optionName:"Tumis bumbu", optionDesc: "5 menit", isInstruction: true),
            Options(optionName:"Memasak telur", optionDesc: "5 menit", isInstruction: true),
            Options(optionName:"Memasak ayam, udang, dan bakso", optionDesc: "10 menit", isInstruction: true),
            Options(optionName:"Memasak nasi", optionDesc: "20 menit", isInstruction: true)
        ])
    ]
}
