
//
//  ServiceManagerResult.swift
//  ServiceLayer
//
//  Created by Jay Park on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

enum ServiceManagerResult<T, Error:Swift.Error> {
    case success(T)
    case failure(Error)
}
