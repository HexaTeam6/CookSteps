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
            Options(optionName:"Pisau", optionDesc: "wajib"),
            Options(optionName:"Telenan", optionDesc: "opsional"),
            Options(optionName:"Wajan", optionDesc: "wajib"),
            Options(optionName:"Panci", optionDesc: "wajib"),
            Options(optionName:"Spatula", optionDesc: "wajib"),
            Options(optionName:"Sendok", optionDesc: "opsional"),
            Options(optionName:"Garpu", optionDesc: "opsional"),
        ]),
        DetailResep(section: "Bahan", options: [
            Options(optionName:"Air", optionDesc: "600ml"),
            Options(optionName:"Bawang merah", optionDesc: "5 biji"),
            Options(optionName:"Bawang putih", optionDesc: "2 biji"),
            Options(optionName:"Kaldu jamur", optionDesc: "1/2 sendok makan"),
            Options(optionName:"Lada", optionDesc: "1/2 sendok makan"),
            Options(optionName:"Telur", optionDesc: "1 buah"),
            Options(optionName:"Garam", optionDesc: "1/4 sendok makan"),
            Options(optionName:"Minyak wijen", optionDesc: "2 sendok makan"),
        ]),
        DetailResep(section: "Cara memasak", options: [
            Options(optionName:"Masak air", optionDesc: "5 menit", isInstruction: true),
            Options(optionName:"Potong bawang", optionDesc: "1 menit", isInstruction: true),
            Options(optionName:"Masak mie", optionDesc: "10 menit", isInstruction: true),
            Options(optionName:"Iris bakso", optionDesc: "1 menit", isInstruction: true),
            Options(optionName:"Panaskan minyak", optionDesc: "30 detik", isInstruction: true),
            Options(optionName:"Goreng telur", optionDesc: "5 menit", isInstruction: true),
            Options(optionName:"Masukkan bawang", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan bakso", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan kecap", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan kaldu jamur", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan lada", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan telur", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan garam", optionDesc: "-", isInstruction: true),
            Options(optionName:"Masukkan minyak wijen", optionDesc: "-", isInstruction: true),
            Options(optionName:"Campur dan aduk rata", optionDesc: "10 menit", isInstruction: true),
        ])
    ]
}
