//
//  TodayView.swift
//  OGloboNews
//
//  Created by Cauê Silva on 22/09/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit

class TodayView: UIView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.text = ""
        messageLabel.text = ""
        dateLabel.textColor = UIColor.primary()
        messageLabel.textColor = UIColor.gray()
    }
    
    func fill() {
        let date = DateParser()
        dateLabel.text = "\(date.currentWeekDayFormat), \(date.currentDateFormat)"
        messageLabel.text = "Confira as manchetes do dia:"
    }
    
}
