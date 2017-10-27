//
//  Extensions.swift
//  DesafioNoticias
//
//  Created by Guilherme Antunes on 27/10/17.
//  Copyright © 2017 Guihsoft. All rights reserved.
//

import Foundation

extension String {
    static func formatDate(string : String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " yyyy-MM-ddTHH:mm:ss-zzzz"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        let formattedDate:Date = dateFormatter.date(from: string) ?? Date()
        dateFormatter.dateFormat = "dd/MM/yy HH:mm"
        let formattedDateString = dateFormatter.string(from: formattedDate)
        
        return formattedDateString
        
    }
}
