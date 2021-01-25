//
//  Suppliers.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import Foundation
import Combine
import SwiftUI

struct allSuppliers : Decodable, Equatable, Comparable {
    let id: String
    let createdAt: String
    let fullname: String
    let avatar: String
    let phone: String
    let company: String
    let email: String
    
    static func < (lhs: allSuppliers , rhs: allSuppliers) -> Bool {
        lhs.fullname < rhs.fullname
    }
}

