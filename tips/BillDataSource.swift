//
//  BillDataSource.swift
//  tips
//
//  Created by Dhara Mehta on 3/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
class BillDataSource {
    var bills:[Bill] = []
    
    class var sharedManager: BillDataSource {
        struct Static {
            static let instance = BillDataSource(bill: nil)
        }
        return Static.instance
    }
    
    init(bill: Bill?){
        bills = []
        if ((bill) != nil) {
            bills.append(bill!)
        }
    }
}