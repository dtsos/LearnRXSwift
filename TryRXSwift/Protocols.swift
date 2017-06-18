//
//  Protocols.swift
//  TryRXSwift
//
//  Created by David Trivian S on 6/17/17.
//  Copyright © 2017 David Trivian S. All rights reserved.
//

import Foundation
enum ValidationResult {
    case ok(message: String)
    case empty
    case validating
    case failed(message: String)
}
