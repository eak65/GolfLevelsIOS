//
//  CreateDelegate.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/18/23.
//

import Foundation

class CreateAdatper: CreateDelegate {
    let presenter : MatchLoadablePresenter
    let apiCreateMatch : PostCreateMatch
    
    public init(presenter: MatchLoadablePresenter, remote: PostCreateMatch ) {
        self.presenter = presenter
        self.apiCreateMatch = remote
    }
    func didCreate(name: String, date: Date) {
        self.presenter.showLoading()
        self.apiCreateMatch.createMatch(name: name, date: date) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.presenter.finishLoadingWithError(error: error)
                case .success():
                    self?.presenter.finishLoadingWithSuccess(match: Match(name: name, date: date,confirmed: [User]()))
                }
            }
        }
    }
}
