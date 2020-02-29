//
//  DateConverter.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-28.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import Foundation


class DateConverter {
    static func dateConversion(using timeStamp: Int) -> String{

        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("h")
        let time = dateFormatter.string(from: date)
        
        return time
    }
}
