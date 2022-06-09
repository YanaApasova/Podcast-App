//
//  Extension+AuthOfPassword.swift
//  PodcastToday
//
//  Created by YANA on 07/06/2022.
//

import Foundation
extension String {
    func safeDatabaseKey() -> String{
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
