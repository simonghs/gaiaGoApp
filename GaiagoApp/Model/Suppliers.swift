//
//  Suppliers.swift
//  GaiagoApp
//
//  Created by Simone on 21/01/21.
//

import Foundation
import Combine
import SwiftUI


struct allSuppliers : Decodable, Equatable {
    public let id: String
    public let createdAt: String
    public let fullname: String
    public let avatar: String
    public let phone: String
    public let company: String
    public let email: String
}

