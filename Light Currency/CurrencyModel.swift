//
//  CurrencyModel.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

struct CurrencyData: Decodable {
    let base: String
    let date: String
    let rates: [String: Double]
}

struct Currency {
    let name: String
    let rate: Double
    
}
