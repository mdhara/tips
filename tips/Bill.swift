//
//  Bill.swift
//  tips
//
//  Created by Dhara Mehta on 3/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class Bill {
    // MARK: Properties
    
    var date: NSDate
    var bill: String
    
    init?(date: NSDate, bill: String) {
        self.date = date
        self.bill = bill
        if(bill.isEmpty) {
            return nil
        }
    }
}