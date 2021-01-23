//
//  Suppliers.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import Foundation
import Combine
import SwiftUI

struct allSuppliers : Decodable, Equatable {
    public var id: String
    public var createdAt: String
    public var fullname: String
    public var avatar: String
    public var phone: String
    public var company: String
    public var email: String
    
//    static func < (lhs: allSuppliers , rhs: allSuppliers) -> Bool {
//        lhs.fullname > rhs.fullname
//    }
}

