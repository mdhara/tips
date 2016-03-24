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
    var amount: String
    
    init?(date: NSDate, bill: String) {
        self.date = date
        self.amount = bill
        if(bill.isEmpty) {
            return nil
        }
    }
    
    func compare(bill: Bill?) -> Bool
    {
        let historyRetainTime: Double = 60 //60 seconds
        if(bill == nil) {
            return false
        }
        return ((-1 * (bill?.date.timeIntervalSinceNow)!) < historyRetainTime && self.amount == bill!.amount)
    }
}