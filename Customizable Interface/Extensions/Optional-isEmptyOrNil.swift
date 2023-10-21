//
//  Optional-isEmptyOrNil.swift
//  Customizable Interface
//
//  Created by Abdulaziz Alsikh on 21.10.2023.
//

import Foundation

extension Optional where Wrapped: Collection {

    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }

}
