//
//  Double-asCurrency.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 23.10.2023.
//

import Foundation

extension Double {
    var asCurrency: String {
        String(format: "%.2f", self) + "TL"
    }
}
