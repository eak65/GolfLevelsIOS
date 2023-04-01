//
//  PostCreateMatch.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/18/23.
//

import Foundation

class PostCreateMatch {
    func createMatch(name: String, date: Date, completion:(Result<Void,Error>)->()) {
        completion(Result{})
    }
}
