//
//  Bill.swift
//  Tip Calculator
//
//  Created by Eduardo Prats on 1/28/16.
//  Copyright © 2016 edprats. All rights reserved.
//

import Foundation

struct Bill {

    var tip = 0.0
    
    var subtotal = 0.0
    
    var tipTotal: Double {
        get {
            return (tip/100) * subtotal
        }
    }
    
    var total: Double {
        return (1 + tip/100) * subtotal
    }
}