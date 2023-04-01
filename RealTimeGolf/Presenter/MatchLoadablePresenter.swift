//
//  LoadablePresenter.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/18/23.
//

import Foundation

class MatchLoadablePresenter {
    let view : LoadableView
    let successView : MatchLoadableSuccessView

    init(view: LoadableView, successView: MatchLoadableSuccessView) {
        self.view = view
        self.successView = successView
    }
    func showLoading(){
        self.view.isLoading(showLoadingIndicator: true)
    }
    func finishLoadingWithSuccess(match: Match) {
        self.view.isLoading(showLoadingIndicator: false)
        self.successView.showSuccess(object: match)
     
    }
    func finishLoadingWithError(error: Error) {
        self.view.isLoading(showLoadingIndicator: false)
        self.view.showError()
    }
}


