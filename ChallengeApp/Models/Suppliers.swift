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
    public let id: String
    public let createdAt: String
    public let fullname: String
    public let avatar: String
    public let phone: String
    public let company: String
    public let email: String
    
    static func < (lhs: allSuppliers , rhs: allSuppliers) -> Bool {
        lhs.fullname > rhs.fullname
    }
}
