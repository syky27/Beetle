//
//  File.swift
//  Beetle
//
//  Created by Tomas Sykora, jr. on 02/03/2019.
//

import Foundation

public struct GitLab {
    let baseUrl: String
    let project: Int
    let privateToken: String

    public init(baseUrl: String, project: Int, privateToken: String) {
        self.baseUrl = baseUrl
        self.project = project
        self.privateToken = privateToken
    }
}
