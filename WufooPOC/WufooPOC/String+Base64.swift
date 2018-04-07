//
//  String+Base64.swift
//  WufooPOC
//
//  Created by Jay Park on 4/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import Foundation

extension String {
    var base64String:String {
        guard let stringData = self.data(using: .utf8) else {
            return ""
        }
        return stringData.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}
